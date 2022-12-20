import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/data/vos/update_profile_request.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/network/dataagents/empress_data_agent.dart';
import 'package:empress_ecommerce_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:empress_ecommerce_app/persistence/daos/category_dao.dart';
import 'package:empress_ecommerce_app/persistence/daos/item_dao.dart';
import 'package:empress_ecommerce_app/persistence/daos/user_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class ItemModelImpl extends ItemModel {
  static final ItemModelImpl _singleton = ItemModelImpl._internal();

  factory ItemModelImpl() {
    return _singleton;
  }

  ItemModelImpl._internal();

  EmpressDataAgent mDataAgent = RetrofitDataAgentImpl();

  /// Daos
  ItemDao mItemDao = ItemDao();
  UserDao mUserDao = UserDao();
  CategoryDao mCategoryDao = CategoryDao();

  String getBearerToken() {
    String userToken = mUserDao.getAllUsers().first.token ?? "";
    return "Bearer $userToken";
  }

  /// Network
  @override
  void getNewArrivalItems() {
    mDataAgent.getNewArrivalItems().then((items) async {
      print(items);
      mItemDao.saveItems(items);
    });
  }

  @override
  void getItemDetail(String itemId) {
    mDataAgent.getItemDetail(itemId).then((item) async {
      mItemDao.saveSingleItem(item);
    });
  }

  @override
  Future<ReviewVO> postReview(String itemId, String comment, int rating) {
    ReviewRequest reviewRequest = ReviewRequest(
      name: "",
      comment: comment,
      rating: rating,
    );
    return mDataAgent
        .postReview(getBearerToken(), itemId, reviewRequest)
        .then((review) {
      return Future.value(review);
    });
  }

  @override
  void getAllCategories() {
    mDataAgent.getAllCategories().then((category) async {
      List<String> categoryList = category ?? [];
      List<CategoryVO> categoryVoList = categoryList.map((category) {
        return CategoryVO(category: category, isSelected: false);
      }).toList();
      mCategoryDao.saveCategories(categoryVoList);
    });
  }

  @override
  Future<List<ItemVO>?> getAllItems({
    required int page,
    required String? order,
    required String? category,
    bool isRemove = false,
    required String rating,
  }) {
    print("Category is $category");
    return mDataAgent
        .getAllItems(page: page, order: order, category: category, rating: rating)
        .then((items) async {
      if (isRemove) {
        mItemDao.removeAllItemsFromDatabase();
      }
      mItemDao.saveItems(items ?? []);
      return Future.value(items);
    });
  }

  /// Database
  @override
  Stream<List<ItemVO>> getNewArrivalItemsFromDatabase() {
    getNewArrivalItems();
    return mItemDao
        .getAllItemsEventStream()
        .startWith(mItemDao.getAllItemsStream())
        .map((event) => mItemDao.getAllItemsForReactive());
  }

  @override
  Stream<ItemVO?> getItemDetailFromDatabase(String itemId) {
    getItemDetail(itemId);
    return mItemDao
        .getAllItemsEventStream()
        .startWith(mItemDao.getItemByIdStream(itemId))
        .map((event) => mItemDao.getItemByIdForReactive(itemId));
  }

  @override
  Stream<List<ItemVO>> getAllItemsFromDatabase() {
    getAllItems(page: 1, order: null, category: null, rating: "0");
    return mItemDao
        .getAllItemsEventStream()
        .startWith(mItemDao.getAllItemsStream())
        .map((event) => mItemDao.getAllItemsForReactive());
  }

  @override
  Stream<List<CategoryVO>> getAllCategoriesFromDatabase() {
    getAllCategories();
    return mCategoryDao
        .getAllCategoriesEventStream()
        .startWith(mCategoryDao.getCategoriesStream())
        .map((event) => mCategoryDao.getCategoriesReactive());
  }
}
