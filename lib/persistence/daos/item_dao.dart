import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class ItemDao {
  static final ItemDao _singleton = ItemDao._internal();

  factory ItemDao() {
    return _singleton;
  }

  ItemDao._internal();

  Box<ItemVO> getItemBox() {
    return Hive.box<ItemVO>(BOX_NAME_ITEM_VO);
  }

  void saveItems(List<ItemVO>? items) async {
    Map<String, ItemVO> itemMap = Map.fromIterable(
      items ?? [],
      key: (item) => item.id,
      value: (item) => item,
    );
    await getItemBox().putAll(itemMap);
  }

  void saveSingleItem(ItemVO? item) async {
    await getItemBox().put(item!.id, item);
  }

  void removeAllItemsFromDatabase() async{
    await getItemBox().deleteAll(getItemBox().keys.toList());
  }

  List<ItemVO> getAllItems() {
    return getItemBox().values.toList();
  }

  ItemVO? getItemById(String itemId) {
    return getItemBox().get(itemId);
  }

  /// Reactive Programming
  Stream<void> getAllItemsEventStream() {
    return getItemBox().watch();
  }

  Stream<List<ItemVO>> getAllItemsStream() {
    List<ItemVO> allItems = getAllItems();
    return Stream.value(allItems);
  }

  Stream<ItemVO?> getItemByIdStream(String itemId) {
    return Stream.value(getItemById(itemId));
  }

  /// New Functions for Reactive
  List<ItemVO> getAllItemsForReactive() {
    if (getAllItems() != null && getAllItems().isNotEmpty) {
      List<ItemVO> allItems = getAllItems();
      return allItems;
    } else {
      return [];
    }
  }

  ItemVO? getItemByIdForReactive(String itemId) {
    if(getItemById(itemId) != null) {
      return getItemById(itemId);
    } else {
      return ItemVO();
    }
  }
}
