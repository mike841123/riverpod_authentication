import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:infinite_scroll/domain/response/flow_page_response/asset_info_list_response.dart';
import 'package:infinite_scroll/domain/response/home_page_response/banner_list_response.dart';
import 'package:infinite_scroll/domain/response/login_page_response/login_response.dart';
import 'package:infinite_scroll/domain/response/public_response/normal_response.dart';
import 'package:infinite_scroll/domain/response/public_response/upload_image_response.dart';
import 'package:infinite_scroll/domain/response/public_response/user_info_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ow_api.g.dart';

@RestApi(baseUrl: "")
abstract class OwApi {
  factory OwApi(Dio dio) = _OwApi;

  /// 檢查圖型驗證碼
  @GET("/public/check-code?randomStr={randomStr}&code={code}")
  Future<HttpResponse<NormalResponse>> checkCaptcha(@Path() String randomStr, @Path() String code, {@CancelRequest() CancelToken? cancelToken});

  /// 登入
  @POST("/authorization/login")
  Future<HttpResponse<LoginResponse>> login(@Field() String username, @Field() String password);

  /// 獲取首頁標頭圖片列表
  @GET("/app-banner/bannerList")
  Future<HttpResponse<BannerListResponse>> getBannerList({@CancelRequest() CancelToken? cancelToken});

  /// 獲取個人信息
  @GET("/memberuser/user-info")
  Future<HttpResponse<UserInfoResponse>> getUserInfo(@Header("authorization") String token, {@CancelRequest() CancelToken? cancelToken});

  /// 上傳圖片
  @POST("/oss-attachment/upload-image")
  @MultiPart()
  Future<HttpResponse<UploadImageResponse>> uploadImage(@Header("authorization") String token, @Part() File uploadFile,
      {@CancelRequest() CancelToken? cancelToken});

  /// 更新會員頭像
  @POST("/memberuser/member-modify-avatar")
  Future<HttpResponse<NormalResponse>> memberModifyAvatar(@Header("authorization") String token, @Field() String avatar,
      {@CancelRequest() CancelToken? cancelToken});

  /// 獲取資金流水列表
  @GET("/assetinfolog/chain-log?page={page}&limit={limit}&assetType={assetType}")
  Future<HttpResponse<AssetInfoListResponse>> getAssetCashList(
      @Header("authorization") String token, @Path() int page, @Path() int limit, @Path() int assetType,
      {@CancelRequest() CancelToken? cancelToken});
}
