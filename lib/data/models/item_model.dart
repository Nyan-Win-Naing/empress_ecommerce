import 'package:empress_ecommerce_app/data/vos/item_vo.dart';

abstract class ItemModel {
  // Network
  void getNewArrivalItems();

  // Database
  Stream<List<ItemVO>> getNewArrivalItemsFromDatabase();
}