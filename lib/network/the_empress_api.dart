import 'package:dio/dio.dart';
import 'package:empress_ecommerce_app/data/vos/login_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/sign_up_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/network/api_constants.dart';
import 'package:empress_ecommerce_app/network/responses/item_list_response.dart';
import 'package:retrofit/http.dart';

part 'the_empress_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheEmpressApi {
  factory TheEmpressApi(Dio dio) = _TheEmpressApi;

  @POST(ENDPOINT_POST_LOG_IN)
  Future<UserVO> postLogin(
    @Body() LoginRequestVO loginRequestVo,
  );

  @POST(ENDPOINT_POST_SIGN_UP)
  Future<UserVO> postSignUp(
    @Body() SignUpRequest signUpRequest,
  );

  @GET(ENDPOINT_GET_NEW_ARRIVAL_ITEMS)
  Future<ItemListResponse> getNewArrivalItems();
}
