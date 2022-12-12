import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/login_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/sign_up_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';

abstract class EmpressDataAgent {
  Future<UserVO?> postLogin(LoginRequestVO loginRequestVo);
  Future<UserVO?> postSignUp(SignUpRequest signUpRequest);
  Future<List<ItemVO>?> getNewArrivalItems();
}