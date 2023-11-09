import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:students/common/core/constants.dart';
import 'dart:ui' as ui;

class Util {
  Util._();
  static String convertPrice(var price) {
    var f = NumberFormat("#,###", "vi_VI");
    price = f.format(price);
    return price;
  }

  static List<int> listMonth() {
    const month = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
    ];
    return month;
  }

  static List<int> listYear() {
    int currentYear = DateTime.now().year;

    List<int> years = [];

    for (int i = currentYear - 15; i <= currentYear + 15; i++) {
      years.add(i);
    }
    return years;
  }
}

mixin Utils {
  static final navigatorState = Constants.navigatorKey.currentState;

  // Get size safe area for screen
  EdgeInsets get sizeSafeArea => MediaQueryData.fromWindow(ui.window).padding;

  // Check device has notch or not
  bool get hasNotch => sizeSafeArea.bottom > 0;
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  void popWithoutContext([dynamic value]) {
    navigatorState?.pop(value);
  }

  Future<dynamic>? pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> push(
    BuildContext context,
    Widget route, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) async {
    if (Platform.isIOS) {
      return Navigator.of(context, rootNavigator: true).push<dynamic>(
        CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => route,
          settings: settings,
        ),
      );
    }
    return navigatorState?.push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (context) => route,
        fullscreenDialog: fullscreenDialog,
        settings: settings,
      ),
    );
  }

  Future<dynamic>? pushAndRemoveUntil(Widget routerName) {
    return navigatorState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => routerName), (route) => false);
  }

  Future<dynamic> pushReplacement(Widget routerName) {
    return navigatorState!.pushReplacement(
      MaterialPageRoute<dynamic>(builder: (context) => routerName),
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    BuildContext context,
    String routerName,
  ) {
    return Navigator.pushNamedAndRemoveUntil(
        context, routerName, (route) => false);
  }

  void unFocusScope(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
