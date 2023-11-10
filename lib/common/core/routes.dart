import 'package:flutter/material.dart';
import 'package:students/screens/class/class_screen.dart';

import 'package:students/screens/dashboard/dashboard_screen.dart';

/// The Routes class contains static constants and a map of named routes to widget builders for
/// navigation in a Flutter app.
class Routes {
  static const dashboardScreen = '/dashboard_screen';
  static const classScreen = '/class_screen';

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => defaultRoute(),
    dashboardScreen: (context) => const DashBoardScreen(),
    classScreen: (context) => const ClassScreen(),
  };

  static defaultRoute() => const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Sorry for the unexpected problem !',
              ),
            ),
            SizedBox(height: 19),
          ],
        ),
      );
}
