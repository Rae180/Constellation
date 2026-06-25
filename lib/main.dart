import 'package:flutter/material.dart';

import 'app/bootstrap/bootstrap.dart';
import 'app/app.dart';

Future<void> main() async {
  await Bootstrap.initialize();

  runApp(const ConstellationApp());
}