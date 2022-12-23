import 'package:dio/dio.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/login_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/data/vos/sign_up_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/update_profile_request.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/network/dataagents/empress_data_agent.dart';
import 'package:empress_ecommerce_app/network/the_empress_api.dart';

class RetrofitDataAgentImpl extends EmpressDataAgent {
  late TheEmpressApi mApi;

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheEmpressApi(dio);
  }

  @override
  Future<UserVO?> postLogin(LoginRequestVO loginRequestVo) {
    return mApi.postLogin(loginRequestVo);
  }

  @override
  Future<UserVO?> postSignUp(SignUpRequest signUpRequest) {
    return mApi.postSignUp(signUpRequest);
  }

  @override
  Future<List<ItemVO>?> getNewArrivalItems() {
    return mApi
        .getNewArrivalItems("1")
        .asStream()
        .map((response) => response.items)
        .first;
  }

  @override
  Future<ItemVO?> getItemDetail(String itemId) {
    return mApi.getItemDetails(itemId);
  }

  @override
  Future<ReviewVO?> postReview(
      String token, String itemId, ReviewRequest reviewRequest) {
    return mApi
        .postReview(token, itemId, reviewRequest)
        .asStream()
        .map((response) => response.review)
        .first;
  }

  @override
  Future<UserVO?> updateProfile(
      String token, UpdateProfileRequest updateProfileRequest) {
    return mApi.putUpdateProfile(token, updateProfileRequest);
  }

  @override
  Future<List<String>?> getAllCategories() {
    return mApi.getAllCategories();
  }

  @override
  Future<List<ItemVO>?> getAllItems({
    required int page,
    required String? order,
    required String? category,
    required String rating,
  }) {
    return mApi
        .getAllItems(page.toString(), order, category, rating)
        .asStream()
        .map((response) => response.items)
        .first;
  }

  @override
  Future<List<ItemVO>?> getSearchedItems({
    required int page,
    required String query,
  }) {
    return mApi
        .getSearchedItems(page.toString(), query)
        .asStream()
        .map((response) => response.items)
        .first;
  }

  @override
  Future<OrderVO?> postNewOrder(String token, OrderVO orderRequest) {
    return mApi
        .postNewOrder(token, orderRequest)
        .asStream()
        .map((response) => response.order)
        .first;
  }

  @override
  Future<List<OrderVO>?> getClientOrders(String token) {
    return mApi.getClientOrders(token);
  }
}
