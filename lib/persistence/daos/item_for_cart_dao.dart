import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class ItemForCartDao {
  static final ItemForCartDao _singleton = ItemForCartDao._internal();

  factory ItemForCartDao() {
    return _singleton;
  }

  ItemForCartDao._internal();

  Box<ItemVO> getItemBox() {
    return Hive.box<ItemVO>(BOX_NAME_ITEM_VO_FOR_CART);
  }

  void saveItems(List<ItemVO>? items) async {
    Map<String, ItemVO> itemMap = Map.fromIterable(
      items ?? [],
      key: (item) => item.id,
      value: (item) => item,
    );
    await getItemBox().putAll(itemMap);
  }

  Future<void> saveSingleItem(ItemVO? item) async {
    return getItemBox().put(item!.id, item);
  }

  void removeAllItemsFromDatabase() async{
    await getItemBox().deleteAll(getItemBox().keys.toList());
  }

  Future<void> removeItemFromDatabase(String itemId) async {
    return getItemBox().delete(itemId);
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
    return Stream.value(getAllItems());
  }

  Stream<ItemVO?> getItemByIdStream(String itemId) {
    return Stream.value(getItemById(itemId));
  }

  /// New Functions for Reactive
  List<ItemVO> getAllItemsForReactive() {
    if (getAllItems() != null && getAllItems().isNotEmpty) {
      return getAllItems();
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
