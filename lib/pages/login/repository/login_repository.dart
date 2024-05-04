abstract class LoginRepository {
  Future<void> login(String username, String password, String randomStr, String code);
}
