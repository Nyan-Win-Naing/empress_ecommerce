import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/models/item_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:flutter/foundation.dart';

class SearchBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  List<ItemVO>? mSearchedItemList;

  /// Model
  ItemModel mItemModel = ItemModelImpl();

  void onSearch(String query) {
    if(query.isNotEmpty) {
      mItemModel.getSearchedItems(page: 1, query: query).then((searchItems) {
        mSearchedItemList = searchItems;
        notifyListeners();
      }).catchError((error) {
        debugPrint(error.toString());
      });
    } else {
      mSearchedItemList = [];
      notifyListeners();
    }

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