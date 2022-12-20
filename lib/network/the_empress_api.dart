import 'package:dio/dio.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/login_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/sign_up_request_vo.dart';
import 'package:empress_ecommerce_app/data/vos/update_profile_request.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/network/api_constants.dart';
import 'package:empress_ecommerce_app/network/responses/item_list_response.dart';
import 'package:empress_ecommerce_app/network/responses/post_review_response.dart';
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

  @GET(ENDPOINT_GET_ALL_ITEMS)
  Future<ItemListResponse> getNewArrivalItems(
    @Query(PARAM_PAGE) String page,
  );

  @GET("$ENDPOINT_GET_ITEM_DETAIL/{item_id}")
  Future<ItemVO?> getItemDetails(
    @Path("item_id") String itemId,
  );

  @POST("/server/items/{item_id}/$ENDPOINT_POST_REVIEW")
  Future<PostReviewResponse> postReview(
    @Header("Authorization") String token,
    @Path("item_id") String itemId,
    @Body() ReviewRequest reviewRequest,
  );

  @PUT(ENDPOINT_PUT_UPDATE_PROFILE)
  Future<UserVO?> putUpdateProfile(
    @Header("Authorization") String token,
    @Body() UpdateProfileRequest updateProfileRequest,
  );

  @GET(ENDPOINT_GET_ALL_CATEGORIES)
  Future<List<String>?> getAllCategories();

  @GET(ENDPOINT_GET_ALL_ITEMS)
  Future<ItemListResponse> getAllItems(
    @Query(PARAM_PAGE) String page,
    @Query(PARAM_ORDER) String? order,
    @Query(PARAM_CATEGORY) String? category,
    @Query(PARAM_RATING) String rating,
  );
}
