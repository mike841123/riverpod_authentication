import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/domain/response/login_page_response/login_response.dart';
import 'package:infinite_scroll/get_it_service_locator.dart';
import '../../../config/app_config.dart';
import '../../../domain/response/public_response/normal_response.dart';
import '../../../service/api_service.dart';
import 'login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<void> login(String username, String password, String randomStr, String code) async {
    await Future.delayed(const Duration(seconds: 2));
    NormalResponse checkCaptchaResponse = await getIt<ApiService>().checkCaptcha(
      randomStr,
      code,
    );
    if (checkCaptchaResponse.data?.result == false) {
      throw Exception('Captcha verification failed');
    } else {
      LoginResponse response = await getIt<ApiService>().login(username, password);
      if (response.code != 0) {
        throw Exception('Login failed');
      }
      if (response.code == 0) {
        AppConfig.token = (response.data?.token_type ?? "") + (response.data?.access_token ?? "");
      }
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl();
});
