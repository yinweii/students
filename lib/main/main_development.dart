import 'package:students/env/env_state.dart';
import 'package:students/main/app.dart';

Future<void> main() async {
  setupAndRunApp(env: EnvValue.development);
}
