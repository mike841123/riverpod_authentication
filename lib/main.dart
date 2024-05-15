import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'config/app_config.dart';
import 'get_it_service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService(); // 初始化 getIt 並實例服務
  AppConfig.sharedPreferences = await SharedPreferences.getInstance(); // 初始化共存器並指到靜態變數

  runApp(
    const ProviderScope(
      child: Material(child: InfiniteScrollApp()),
    ),
  );
}
