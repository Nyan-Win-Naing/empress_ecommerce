import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/models/item_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:flutter/foundation.dart';

class ShopBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  List<CategoryVO>? categoryList;
  List<ItemVO>? itemList;
  String? selectedOrder;
  String? selectedCategory;
  String selectedRating = "0";
  bool isShowClearButton = false;
  String sortBy = "newest";

  /// Page
  int pageForItems = 1;

  /// Model
  ItemModel mItemModel = ItemModelImpl();

  ShopBloc() {
    /// Get All Categories
    mItemModel.getAllCategoriesFromDatabase().listen((categoryList) {
      this.categoryList = categoryList;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });

    /// Get All Items From Database
    getAllItemsFromDatabase();
  }

  void getAllItemsFromDatabase() {
    mItemModel.getAllItemsFromDatabase().listen((itemList) {
      this.itemList = itemList;
      if (sortBy == "newest") {
        if (this.itemList != null && (this.itemList?.isNotEmpty ?? false)) {
          this.itemList?.sort(
              (a, b) => (b.createdAt ?? "").compareTo(a.createdAt ?? ""));
        }
      } else if (sortBy == "lowest") {
        this.itemList?.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
      } else if (sortBy == "highest") {
        this.itemList?.sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
      } else if (sortBy == "toprated") {
        this.itemList?.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
      }
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void onItemListEndReached() {
    pageForItems += 1;
    mItemModel.getAllItems(
      page: pageForItems,
      order: selectedOrder,
      category: selectedCategory,
      rating: selectedRating,
    );
  }

  void onTapCategory(String categoryKey) {
    isShowClearButton = true;
    notifyListeners();
    clearAllSelectionFromCategoryList();
    categoryList = categoryList?.map((categoryVo) {
      if (categoryKey == (categoryVo.category ?? "")) {
        categoryVo.isSelected = true;
      }
      return categoryVo;
    }).toList();
    notifyListeners();

    pageForItems = 1;
    selectedCategory = categoryKey;
    _getAllItems();
  }

  void onTapSortBy(String sortByValue) {
    sortBy = sortByValue;
    notifyListeners();

    pageForItems = 1;
    selectedOrder = sortBy;
    _getAllItems();
  }

  void onTapRating(String ratingValue) {
    selectedRating = ratingValue;
    notifyListeners();

    pageForItems = 1;
    _getAllItems();
  }

  void _getAllItems() {
    mItemModel.getAllItems(
      page: pageForItems,
      order: selectedOrder,
      category: selectedCategory,
      rating: selectedRating,
      isRemove: true,
    );
  }

  void clearAllSelectionFromCategoryList() {
    categoryList?.forEach((categoryVo) {
      categoryVo.isSelected = false;
    });
  }

  void onTapClear() {
    clearAllSelectionFromCategoryList();
    selectedCategory = null;
    isShowClearButton = false;
    notifyListeners();
    pageForItems = 1;
    _getAllItems();
  }

  Future<void> onTapAddToCart(ItemVO? item) {
    return mItemModel.addItemToCart(item);
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
