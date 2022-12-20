import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/models/item_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:flutter/foundation.dart';

class ProductDetailBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  ItemVO? item;
  int dropdownValue = 0;
  String comment = "";
  String itemId = "";

  /// Model
  ItemModel mItemModel = ItemModelImpl();

  ProductDetailBloc(String itemId) {
    this.itemId = itemId;

    /// Item Detail Database
    mItemModel.getItemDetailFromDatabase(itemId).listen((item) {
      this.item = item;
      notifyListeners();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void onChangedDropdown(int dropdownValue) {
    this.dropdownValue = dropdownValue;
    notifyListeners();
  }

  void onChangedComment(String comment) {
    this.comment = comment;
  }

  Future<ReviewVO> onTappedButton() {
    if(comment.isEmpty) {
      return Future.error("Comment Field must be filled!");
    } else {
      return mItemModel.postReview(itemId, comment, dropdownValue).then((review) {
        _clearAllData();
        mItemModel.getItemDetail(itemId);
        return Future.value(review);
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }
  }

  void _clearAllData() {
    dropdownValue = 0;
    comment = "";
    notifyListeners();
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