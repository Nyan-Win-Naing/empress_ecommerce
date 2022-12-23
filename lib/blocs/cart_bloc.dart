import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/models/item_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:flutter/foundation.dart';

class CartBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  List<ItemVO>? itemList;
  int totalItemCount = 0;
  double totalAmount = 0;

  /// Models
  ItemModel mItemModel = ItemModelImpl();

  CartBloc() {
    /// Items From Cart From From Database
    mItemModel.getItemsFromCartFromDatabase().listen((itemList) {
      this.itemList = itemList;
      notifyListeners();

      calculateTotalItemCount(itemList);
      calculateTotalAmount(itemList);
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void calculateTotalAmount(List<ItemVO> itemList) {
    itemList.forEach((itemVo) {
      totalAmount = totalAmount + itemVo.getAmount();
      notifyListeners();
    });
  }

  void calculateTotalItemCount(List<ItemVO> itemList) {
    itemList.forEach((itemVo) {
      totalItemCount = totalItemCount + (itemVo.itemCount ?? 0);
      notifyListeners();
    });
  }

  void onTapAdd(ItemVO? itemVo) {
    totalItemCount = 0;
    totalAmount = 0;
    itemVo?.itemCount = (itemVo.itemCount ?? 0) + 1;
    mItemModel.addItemCountToCart(itemVo);
  }

  void onTapMinus(ItemVO? itemVo) {
    totalItemCount = 0;
    totalAmount = 0;
    itemVo?.itemCount = (itemVo.itemCount ?? 0) - 1;
    mItemModel.minusItemCountToCart(itemVo);
  }

  void onTapDelete(ItemVO? itemVo) {
    totalItemCount = 0;
    totalAmount = 0;
    mItemModel.deleteItemFromCart(itemVo);
  }

  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if(!_disposed) {
      super.notifyListeners();
    }
  }
}