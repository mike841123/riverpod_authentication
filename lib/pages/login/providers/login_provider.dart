import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/model/providers/user_providers.dart';
import 'package:infinite_scroll/pages/login/providers/random_provider.dart';
import 'package:infinite_scroll/pages/login/state/login_state.dart';
import '../repository/login_repository_impl.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.ref) : super(const LoginState());

  final Ref ref;

  Future<void> login(String username, String password, String code,Function completedFunc) async {
    state = const LoginStateLoading();
    try {
      final String randomStr = ref.read(randomProvider); // 取得隨機字串狀態
      await ref.read(loginRepositoryProvider).login(username, password, randomStr, code);
      completedFunc(); // 成功事件
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }
}
