import 'package:infinite_scroll/config/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static String get token {
    return sharedPreferences.getString(SPKey.ACCESS_TOKEN) ?? "";
  } // 獲取 api 所需 token

  static late SharedPreferences sharedPreferences; // 保存本地參數

  static set token(String value) {
    sharedPreferences.setString(SPKey.ACCESS_TOKEN, value);
  }
}
