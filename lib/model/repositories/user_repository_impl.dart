import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll/domain/response/public_response/digital_bank_response.dart';
import 'package:infinite_scroll/domain/response/public_response/normal_response.dart';
import 'package:infinite_scroll/domain/response/public_response/upload_image_response.dart';
import 'package:infinite_scroll/domain/response/public_response/user_info_response.dart';
import 'package:infinite_scroll/model/repositories/user_repository.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../get_it_service_locator.dart';
import '../../service/api_service.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserInfoResult> getUserInfo() async {
    UserInfoResponse response = await getIt<ApiService>().getUserInfo();
    return response.data ?? UserInfoResult();
  }

  @override
  Future<NormalResponse> memberModifyAvatar(String avatar) async {
    NormalResponse response = await getIt<ApiService>().memberModifyAvatar(avatar);
    return response;
  }

  @override
  Future<UploadImageResponse> uploadImage() async {
    UploadImageResponse response = UploadImageResponse();
    try {
      ImagePicker imagePicker = ImagePicker();
      // ＊＊＊ 模擬器點選第一張會異常，實機不會有此問題 ＊＊＊
      await imagePicker.pickImage(source: ImageSource.gallery, maxHeight: 1000, maxWidth: 1000, imageQuality: 50).then((value) async {
        if (value != null) {
          File imageFile = File(value.path);
          response = await getIt<ApiService>().uploadImage(imageFile);
        }
      });
    } catch (e) {
      PermissionStatus status = await Permission.photos.status;
      if (status == PermissionStatus.denied) {
        print("未開啟相簿權限");
      }
    }
    return response;
  }

  @override
  Future<DigitalBankResult> getDigitalBankResult() async {
    try {
      DigitalBankResponse response = await getIt<ApiService>().getDigitalBank();
      return response.data ?? DigitalBankResult();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});
