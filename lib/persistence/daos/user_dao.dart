import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class UserDao {
  static final UserDao _singleton = UserDao._internal();

  factory UserDao() {
    return _singleton;
  }

  UserDao._internal();

  void saveSingleUser(UserVO? user) async {
    await getUserBox().put(user!.id, user);
  }

  List<UserVO> getAllUsers() {
    return getUserBox().values.toList();
  }

  UserVO? getUserById(int userId) {
    return getUserBox().get(userId);
  }

  Future<void> removeAllUsers() async {
    return getUserBox().deleteAll(getUserBox().keys.toList());
  }

  Box<UserVO> getUserBox() {
    return Hive.box<UserVO>(BOX_NAME_USER_VO);
  }

  /// Reactive Programming
  Stream<void> getAllUsersEventStream() {
    return getUserBox().watch();
  }

  Stream<List<UserVO>> getAllUsersStream() {
    return Stream.value(getAllUsers());
  }

  Stream<UserVO> getUserStream(int userId) {
    return Stream.value(getUserById(userId) ?? UserVO());
  }

  /// New Functions For Reactive
  UserVO getUserForReactive(int userId) {
    if(getUserById(userId) != null) {
      return getUserById(userId)!;
    } else {
      return UserVO();
    }
  }

  List<UserVO> getAllUsersForReactive() {
    if(getAllUsers() != null && getAllUsers().isNotEmpty) {
      return getAllUsers();
    } else {
      return [];
    }
  }
}
