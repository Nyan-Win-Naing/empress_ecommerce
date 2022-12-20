import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';

abstract class ItemModel {
  // Network
  void getNewArrivalItems();
  void getItemDetail(String itemId);
  Future<ReviewVO> postReview(String itemId, String comment, int rating);
  void getAllCategories();
  Future<List<ItemVO>?> getAllItems({
    required int page,
    required String? order,
    required String? category,
    bool isRemove = false,
    required String rating,
  });

  // Database
  Stream<List<ItemVO>> getNewArrivalItemsFromDatabase();
  Stream<ItemVO?> getItemDetailFromDatabase(String itemId);
  Stream<List<ItemVO>> getAllItemsFromDatabase();
  Stream<List<CategoryVO>> getAllCategoriesFromDatabase();
}
