import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/models/item_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:flutter/foundation.dart';

class OrderHistoryBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  List<OrderVO>? mOrderList;

  /// Model
  ItemModel mItemModel = ItemModelImpl();

  OrderHistoryBloc() {
    /// Get Client Orders
    mItemModel.getClientOrdersFromDatabase().listen((orderList) {
      if(orderList.isNotEmpty) {
        orderList.sort((a, b) => (b.createdAt ?? "").compareTo(a.createdAt ?? ""));
      }
      mOrderList = orderList;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
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