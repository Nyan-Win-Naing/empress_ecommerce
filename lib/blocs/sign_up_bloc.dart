import 'package:empress_ecommerce_app/data/models/user_model.dart';
import 'package:empress_ecommerce_app/data/models/user_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:flutter/foundation.dart';

class SignUpBloc extends ChangeNotifier {
  /// States
  bool _disposed = false;
  bool isLoading = false;
  String name = "";
  String email = "";
  String password = "";
  bool isEmptyError = false;

  /// Model
  UserModel mUserModel = UserModelImpl();

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  void onNameChanged(String name) {
    this.name = name;
  }

  void onEmailChanged(String email) {
    this.email = email;
  }

  void onPasswordChanged(String password) {
    this.password = password;
  }

  Future<UserVO?> onTapSignUp() {
    if(name.isEmpty || email.isEmpty || password.isEmpty) {
      return Future.error("All fields must be filled!");
    } else {
      showLoading();
      return mUserModel.postSignUp(name, email, password).whenComplete(() {
        hideLoading();
      });
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