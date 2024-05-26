import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:infinite_scroll/domain/response/api_response.dart';
import 'package:infinite_scroll/domain/response/flow_page_response/asset_info_list_response.dart';
import 'package:infinite_scroll/domain/response/home_page_response/banner_list_response.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/exchange_rate_response.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_info_response.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_order_response.dart';
import 'package:infinite_scroll/domain/response/insurance_page_response/insurance_qrcode_response.dart';
import 'package:infinite_scroll/domain/response/login_page_response/login_response.dart';
import 'package:infinite_scroll/domain/response/public_response/digital_bank_response.dart';
import 'package:infinite_scroll/domain/response/public_response/normal_response.dart';
import 'package:infinite_scroll/domain/response/public_response/upload_image_response.dart';
import 'package:infinite_scroll/domain/response/public_response/user_info_response.dart';
import 'package:infinite_scroll/domain/response/save_coin_response/save_coin_history_response.dart';
import 'package:infinite_scroll/domain/response/save_coin_response/save_coin_rate_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ow_api.g.dart';

@RestApi(baseUrl: "11")
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

  /// 獲取投資天數利率設定
  @GET("/invested/getRate")
  Future<HttpResponse<SaveCoinRateResponse>> getSaveCoinRate(@Header("authorization") String token, {@CancelRequest() CancelToken? cancelToken});

  /// 數字銀行訊息
  @GET("/assetinfo/digital-bank")
  Future<HttpResponse<DigitalBankResponse>> getDigitalBank(@Header("authorization") String token, {@CancelRequest() CancelToken? cancelToken});

  /// 發送存幣生息訂單
  @POST("/invested/send-order")
  Future<HttpResponse<ApiResponse<String>>> sendSaveCoin(
      @Header("authorization") String token, @Field() int id, @Field() String investedAmount, @Field() int autoSubscribe, @Field() String payPassword,
      {@CancelRequest() CancelToken? cancelToken});

  /// 獲取存幣生息歷史紀錄
  @GET("/invested/getRecordPage?page={page}&limit={limit}{assetType}{optionType}{status}{startTime}{endTime}")
  Future<HttpResponse<SaveCoinHistoryResponse>> getSaveCoinHistory(@Header("authorization") String token, @Path() int page, @Path() int limit,
      @Path() String? assetType, @Path() String? optionType, @Path() String? status, @Path() String? startTime, @Path() String? endTime,
      {@CancelRequest() CancelToken? cancelToken});

  /// 修改自動申購
  @POST("/invested/updateAutoSubscribe")
  Future<HttpResponse<NormalResponse>> updateAutoSubscribe(@Header("authorization") String token, @Field() int id, @Field() int autoSubscribe,
      {@CancelRequest() CancelToken? cancelToken});

  @GET("/insurance/getAllInsuranceOrder")
  Future<HttpResponse<InsuranceOrderResponse>> getAllInsuranceOrder(
      @Header("authorization") String token, @Query("username") String username, @Query("limit") int limit, @Query("page") int page,
      {@CancelRequest() CancelToken? cancelToken});

  @GET("/insurance/getAllInsuranceInfo")
  Future<HttpResponse<InsuranceInfoResponse>> getAllInsuranceInfo(@Header("authorization") String token, {@CancelRequest() CancelToken? cancelToken});

  @GET("/membercountry/exchangeRate")
  Future<HttpResponse<ExchangeRateResponse>> getExchangeRate(@Header("authorization") String token, {@CancelRequest() CancelToken? cancelToken});

  @GET("/insurance/getCustomerQrCode")
  Future<HttpResponse<InsuranceQrcodeResponse>> getCustomerQrCode(@Header("authorization") String token, @Query("countryId") int countryId,
      {@CancelRequest() CancelToken? cancelToken});

  /// 上傳S3圖片
  @POST("/oss-attachment/upload-image-s3")
  @MultiPart()
  Future<HttpResponse<UploadImageResponse>> uploadImageS3(@Header("authorization") String token, @Part() List<File> uploadFile, @Part() String path,
      {@CancelRequest() CancelToken? cancelToken});
}
