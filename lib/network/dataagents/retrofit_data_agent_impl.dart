import 'package:dio/dio.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/login_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/sign_up_request_vo.dart';
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
        .getNewArrivalItems()
        .asStream()
        .map((response) => response.items)
        .first;
  }
}
