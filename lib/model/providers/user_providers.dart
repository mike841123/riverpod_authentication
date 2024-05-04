import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/public_response/normal_response.dart';
import 'package:infinite_scroll/domain/response/public_response/upload_image_response.dart';
import 'package:infinite_scroll/domain/response/public_response/user_info_response.dart';
import 'package:infinite_scroll/model/repositories/user_repository_impl.dart';
import '../state/user_state.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref);
});

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this.ref) : super(const UserState());

  final Ref ref;

  Future<void> getUserInfo() async {
    final repository = ref.read(userRepositoryProvider);
    UserInfoResult userInfoResult = await repository.getUserInfo();
    state = state.copyWith(userInfoResult: userInfoResult);
  }

  Future<void> modifyAvatar() async {
    final repository = ref.read(userRepositoryProvider);
    UploadImageResponse uploadImageResponse = await repository.uploadImage();
    if (uploadImageResponse.code == 0) {
      NormalResponse normalResponse = await repository.memberModifyAvatar(uploadImageResponse.data?.first.imgSrc ?? "");
      if (normalResponse.code == 0) {
        getUserInfo();
      }
    }
  }
}
