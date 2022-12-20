import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/models/item_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:flutter/foundation.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  List<ItemVO>? newArrivalItems;

  /// Model
  ItemModel mItemModel = ItemModelImpl();

  HomeBloc() {
    /// New Arrival Items Database
    mItemModel.getNewArrivalItemsFromDatabase().listen((itemList) {
      if(itemList.isNotEmpty && itemList.length >= 6) {
        itemList.sort((a, b) => (b.createdAt ?? "").compareTo(a.createdAt ?? ""));
        newArrivalItems = itemList.getRange(0, 6).toList();
      }
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
    if(!_disposed) {
      super.notifyListeners();
    }
  }
}
