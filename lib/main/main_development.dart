import 'package:flutter/material.dart';
import 'package:students/env/env_state.dart';
import 'package:students/firebase_options.dart';
import 'package:students/main/app.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupAndRunApp(env: EnvValue.development);
}
