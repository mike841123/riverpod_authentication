import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll/config/routes/routes_location.dart';
import 'package:infinite_scroll/config/routes/routes_provider.dart';

import '../../pages/home/home_page.dart';
import '../../pages/login/login_page.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.login,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginPage();
    },
  ),
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const HomePage();
    },
  ),
];
