import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:flutter/foundation.dart';

class OrderConfirmBloc extends ChangeNotifier {
  /// States
  List<ItemVO>? mItemList;
  bool _disposed = false;

  OrderConfirmBloc(List<OrderItemVO> orderList) {
    mItemList = orderList.map((orderItemVo) {
      return ItemVO(
        name: orderItemVo.name,
        price: orderItemVo.price,
        itemCount: orderItemVo.quantity,
        image: orderItemVo.image,
      );
    }).toList();
    notifyListeners();
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