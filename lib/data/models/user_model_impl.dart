import 'package:empress_ecommerce_app/data/models/user_model.dart';
import 'package:empress_ecommerce_app/data/vos/login_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/sign_up_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/update_profile_request.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/network/dataagents/empress_data_agent.dart';
import 'package:empress_ecommerce_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:empress_ecommerce_app/persistence/daos/user_dao.dart';
import 'package:flutter/foundation.dart';
import 'package:stream_transform/stream_transform.dart';

class UserModelImpl extends UserModel {
  static final UserModelImpl _singleton = UserModelImpl._internal();

  factory UserModelImpl() {
    return _singleton;
  }

  UserModelImpl._internal();

  EmpressDataAgent mDataAgent = RetrofitDataAgentImpl();

  /// Daos
  UserDao mUserDao = UserDao();

  String getBearerToken() {
    String userToken = mUserDao.getAllUsers().first.token ?? "";
    return "Bearer $userToken";
  }

  @override
  Future<UserVO?> postLogin(String email, String password) {
    LoginRequestVO loginRequestVo = LoginRequestVO(
      email: email,
      password: password,
    );
    return mDataAgent.postLogin(loginRequestVo).then((user) async {
      mUserDao.saveSingleUser(user);
      return Future.value(user);
    });
  }

  @override
  Future<UserVO?> postSignUp(String name, String email, String password) {
    SignUpRequest signUpRequest = SignUpRequest(
      name: name,
      email: email,
      password: password,
    );
    return mDataAgent.postSignUp(signUpRequest).then((user) {
      mUserDao.saveSingleUser(user);
      return Future.value(user);
    });
  }

  @override
  Future<UserVO?> updateProfile(String name, String email) {
    UpdateProfileRequest updateProfileRequest = UpdateProfileRequest(
      name: name,
      email: email,
      password: "",
    );
    return mDataAgent
        .updateProfile(getBearerToken(), updateProfileRequest)
        .then((user) async {
      mUserDao.saveSingleUser(user);
      return Future.value(user);
    });
  }

  // Database
  @override
  Stream<List<UserVO>> getAllUsersFromDatabase() {
    return mUserDao
        .getAllUsersEventStream()
        .startWith(mUserDao.getAllUsersStream())
        .map((event) => mUserDao.getAllUsersForReactive());
  }

  @override
  bool isLoggedIn() {
    return mUserDao.getAllUsers().isNotEmpty;
  }

  @override
  Future<void> logout() {
    return mUserDao.removeAllUsers();
  }
}
