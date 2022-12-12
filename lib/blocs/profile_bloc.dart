import 'package:empress_ecommerce_app/data/models/user_model.dart';
import 'package:empress_ecommerce_app/data/models/user_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:flutter/foundation.dart';

class ProfileBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  UserVO? loggedInUser;

  /// Model
  UserModel _mUserModel = UserModelImpl();

  ProfileBloc() {
    _mUserModel.getAllUsersFromDatabase().listen((userList) {
      if(userList.isNotEmpty) {
        loggedInUser = userList[0];
        notifyListeners();
      }
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> onTapLogout() {
    return _mUserModel.logout().whenComplete(() {});
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