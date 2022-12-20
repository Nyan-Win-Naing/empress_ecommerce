import 'package:empress_ecommerce_app/data/models/user_model.dart';
import 'package:empress_ecommerce_app/data/models/user_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:flutter/foundation.dart';

class ProfileBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  UserVO? loggedInUser;
  String username = "";
  String email = "";

  /// Model
  UserModel _mUserModel = UserModelImpl();

  ProfileBloc() {
    _mUserModel.getAllUsersFromDatabase().listen((userList) {
      if(userList.isNotEmpty) {
        loggedInUser = userList[0];
        notifyListeners();
        print(loggedInUser?.token);
      }
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> onTapLogout() {
    return _mUserModel.logout().whenComplete(() {});
  }

  void onNameChanged(String username) {
    this.username = username;
  }

  void onEmailChanged(String email) {
    this.email = email;
  }

  Future<UserVO?> onTapUpdate() {
    if(username.isEmpty || email.isEmpty) {
      return Future.error("All fields must be filled!");
    } else {
      return _mUserModel.updateProfile(username, email).then((user) {
        clearAllText();
        return Future.value(user);
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }
  }

  void clearAllText() {
    username = "";
    email = "";
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