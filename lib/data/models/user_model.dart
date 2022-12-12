import 'package:empress_ecommerce_app/data/vos/user_vo.dart';

abstract class UserModel {
  // Network
  Future<UserVO?> postLogin(String email, String password);
  Future<UserVO?> postSignUp(String name, String email, String password);

  // Database
  Stream<List<UserVO>> getAllUsersFromDatabase();
  bool isLoggedIn();
  Future<void> logout();
}