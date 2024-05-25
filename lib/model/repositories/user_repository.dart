import 'package:infinite_scroll/domain/response/public_response/normal_response.dart';

import '../../domain/response/public_response/digital_bank_response.dart';
import '../../domain/response/public_response/upload_image_response.dart';
import '../../domain/response/public_response/user_info_response.dart';

abstract class UserRepository {
  Future<UserInfoResult> getUserInfo();
  Future<UploadImageResponse> uploadImage();
  Future<NormalResponse> memberModifyAvatar(String avatar);
  Future<DigitalBankResult> getDigitalBankResult();
  Future<UploadImageResponse> uploadImageS3(String path,{bool isMulti = false});
}
