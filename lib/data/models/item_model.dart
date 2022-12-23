import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/delivery_address_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
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
  Future<List<ItemVO>?> getSearchedItems(
      {required int page, required String query});
  Future<OrderVO?> confirmOrder({
    required DeliveryAddressVO deliveryAddress,
    required List<OrderItemVO> orderItemList,
    required String paymentMethod,
    required double itemsPrice,
    required double deliveryPrice,
    required double taxPrice,
    required double totalPrice,
  });
  void getClientOrders();

  // Database
  Stream<List<ItemVO>> getNewArrivalItemsFromDatabase();
  Stream<ItemVO?> getItemDetailFromDatabase(String itemId);
  Stream<List<ItemVO>> getAllItemsFromDatabase();
  Stream<List<CategoryVO>> getAllCategoriesFromDatabase();
  Future<void> addItemToCart(ItemVO? itemVo);
  Stream<List<ItemVO>> getItemsFromCartFromDatabase();
  Future<void> addItemCountToCart(ItemVO? itemVo);
  Future<void> minusItemCountToCart(ItemVO? itemVo);
  Future<void> deleteItemFromCart(ItemVO? itemVo);
  Stream<List<OrderVO>> getClientOrdersFromDatabase();
}
