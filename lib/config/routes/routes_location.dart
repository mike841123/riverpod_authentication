import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteLocation {
  const RouteLocation._();

  static String get home => '/home';
  static String get login => '/login';
  static String get flow => '/flow';
  static String get invested => '/invested';
  static String get investedRecord => '/investedRecord';
}
