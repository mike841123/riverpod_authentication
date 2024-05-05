import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../config/app_config.dart';
import '../domain/ow_api.dart';
import '../domain/request/member_page_request/asset_info_list_request.dart';
import '../domain/response/flow_page_response/asset_info_list_response.dart';
import '../domain/response/home_page_response/banner_list_response.dart';
import '../domain/response/login_page_response/login_response.dart';
import '../domain/response/public_response/normal_response.dart';
import '../domain/response/public_response/upload_image_response.dart';
import '../domain/response/public_response/user_info_response.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    // 請求設定
    dio.options.connectTimeout = const Duration(seconds: 4);
    // api 的 AOP
    if (dio.interceptors.isNotEmpty) {
      dio.interceptors.clear();
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(response);
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  /// 檢查圖型驗證碼
  /// * [randomStr] 隨機亂數
  /// * [code] 驗證碼
  Future<NormalResponse> checkCaptcha(String randomStr, String code) async {
    final HttpResponse<NormalResponse> response = await OwApi(dio).checkCaptcha(randomStr, code);
    return response.data;
  }

  /// 獲取首頁標頭圖片列表
  Future<BannerListResponse> getBannerList() async {
    final HttpResponse<BannerListResponse> response = await OwApi(dio).getBannerList();
    return response.data;
  }

  /// 登入
  /// * [request] 登入請求參數
  Future<LoginResponse> login(String username, String password, {Function(HttpResponse<dynamic> res)? replaceFunc}) async {
    final HttpResponse<LoginResponse> response = await OwApi(dio).login(username, password);
    return response.data;
  }

  /// 獲取個人信息
  Future<UserInfoResponse> getUserInfo() async {
    final HttpResponse<UserInfoResponse> response = await OwApi(dio).getUserInfo(AppConfig.token);
    return response.data;
  }

  /// 上傳圖片
  Future<UploadImageResponse> uploadImage(File file) async {
    final HttpResponse<UploadImageResponse> response = await OwApi(dio).uploadImage(AppConfig.token, file);
    return response.data;
  }

  /// 更新頭像
  Future<NormalResponse> memberModifyAvatar(String avatar) async {
    final HttpResponse<NormalResponse> response = await OwApi(dio).memberModifyAvatar(AppConfig.token, avatar);
    return response.data;
  }

  /// 獲取資金流水列表
  Future<AssetInfoListResponse> getAssetCashList(AssetInfoListRequest request) async {
    final HttpResponse<AssetInfoListResponse> response = await OwApi(dio).getAssetCashList(AppConfig.token, request.page, request.limit, request.type);
    return response.data;
  }
}
