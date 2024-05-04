import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll/config/app_config.dart';
import 'package:infinite_scroll/config/routes/routes_location.dart';
import 'package:infinite_scroll/model/providers/user_providers.dart';
import 'app_routes.dart';

final navigationKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: AppConfig.token.isNotEmpty ? RouteLocation.home : RouteLocation.login,
      navigatorKey: navigationKey,
      routes: appRoutes,
      redirect:(context,state) {
        if(state.fullPath == RouteLocation.home) {
          ref.read(userProvider.notifier).getUserInfo();
        }
      }
    );
  },
);
