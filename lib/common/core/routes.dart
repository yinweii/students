import 'package:flutter/material.dart';
import 'package:students/login/login_screen.dart';
import 'package:students/screens/check_in/check_in_screen.dart';
import 'package:students/screens/class/class_screen.dart';
import 'package:students/screens/class_list/class_list_screen.dart';
import 'package:students/screens/create_student/create_student.dart';

import 'package:students/screens/dashboard/dashboard_screen.dart';
import 'package:students/screens/home/home_screen.dart';

/// The Routes class contains static constants and a map of named routes to widget builders for
/// navigation in a Flutter app.
class Routes {
  static const loginScreen = '/login_screen';
  static const dashboardScreen = '/dashboard_screen';
  static const homeScreen = '/home_screen';
  static const classScreen = '/class_screen';
  static const createStudent = '/create_student_screen';
  static const checkInScreen = '/check_in_screen';
  static const classListScreen = '/class_list_screen';

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => defaultRoute(),
    // dashboardScreen: (context) => const DashBoardScreen(),
    loginScreen: (context) => const LogInScreen(),
    classScreen: (context) => const ClassScreen(),
    homeScreen: (context) => const HomeScreen(),
    createStudent: (context) => const CreateStudentScreen(),
    checkInScreen: (context) => const CheckInScreen(),
    classListScreen: (context) => const ClassListScreen(),
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
