import 'package:flutter/material.dart';
import 'package:students/env/env_state.dart';
import 'package:students/main/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupAndRunApp(env: EnvValue.production);
}
