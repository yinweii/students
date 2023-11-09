import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();

  static Future<dynamic> pushNamed(
    String routeName, {
    dynamic argument,
  }) async {
    await navigatorKey.currentState
        ?.pushNamed<dynamic>(routeName, arguments: argument);
  }
}
