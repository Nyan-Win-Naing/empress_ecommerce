import 'package:empress_ecommerce_app/data/models/user_model.dart';
import 'package:empress_ecommerce_app/data/models/user_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:flutter/foundation.dart';

class LogInBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  String email = "";
  String password = "";
  bool isLoading = false;
  bool isFormEmptyError = false;

  /// Model
  UserModel mUserModel = UserModelImpl();

  void onEmailChanged(String email) {
    this.email = email;
  }

  void onPasswordChanged(String password) {
    this.password = password;
  }

  Future<UserVO?> onTapLogin() {
    if(email.isEmpty || password.isEmpty) {
      isFormEmptyError = true;
      notifyListeners();
      return Future.error("All fields must be filled!");
    } else {
      showLoading();
      isFormEmptyError = false;
      notifyListeners();
      return mUserModel.postLogin(email, password).whenComplete(() {
        hideLoading();
      });
    }
  }

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
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