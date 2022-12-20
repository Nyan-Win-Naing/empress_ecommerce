import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/login_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/data/vos/sign_up_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/update_profile_request.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';

abstract class EmpressDataAgent {
  Future<UserVO?> postLogin(LoginRequestVO loginRequestVo);
  Future<UserVO?> postSignUp(SignUpRequest signUpRequest);
  Future<List<ItemVO>?> getNewArrivalItems();
  Future<ItemVO?> getItemDetail(String itemId);
  Future<ReviewVO?> postReview(
      String token, String itemId, ReviewRequest reviewRequest);
  Future<UserVO?> updateProfile(
      String token, UpdateProfileRequest updateProfileRequest);
  Future<List<String>?> getAllCategories();
  Future<List<ItemVO>?> getAllItems({
    required int page,
    required String? order,
    required String? category,
    required String rating,
  });
}
