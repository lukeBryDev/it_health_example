import 'package:flutter/material.dart';
import 'package:it_health_example/src/core/env/env.dart';
import 'package:it_health_example/src/features/app/app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Env(EnvMode.sandbox);
  runApp(const App());
}
