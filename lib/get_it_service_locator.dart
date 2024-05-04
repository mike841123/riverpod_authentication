import 'package:get_it/get_it.dart';
import 'package:infinite_scroll/service/api_service.dart';

/// 取得 GetIt 的實例
final GetIt getIt = GetIt.instance;

///註冊 Service
Future<void> initializeService() async {
  getIt.registerSingleton(ApiService());
}
