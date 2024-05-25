import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll/config/routes/routes_location.dart';
import 'package:infinite_scroll/config/routes/routes_provider.dart';
import 'package:infinite_scroll/pages/flow/flow_page.dart';
import 'package:infinite_scroll/pages/insurance_management/insurance_management_page.dart';
import 'package:infinite_scroll/pages/invested/invested_page.dart';

import '../../pages/home/home_page.dart';
import '../../pages/insurance_register/insurance_register_page.dart';
import '../../pages/invested_record/invested_record_page.dart';
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
  GoRoute(
    path: RouteLocation.flow,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const FlowPage();
    },
  ),
  GoRoute(
    path: RouteLocation.invested,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const InvestedPage();
    },
  ),
  GoRoute(
    path: RouteLocation.investedRecord,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const InvestedRecordPage();
    },
  ),
  GoRoute(
    path: RouteLocation.insuranceManagement,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const InsuranceManagementPage();
    },
  ),
  GoRoute(
    path: RouteLocation.insuranceRegister,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const InsuranceRegisterPage();
    },
  ),
];
