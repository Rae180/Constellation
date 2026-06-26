import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/bootstrap/bootstrap.dart';
import 'app/app.dart';

Future<void> main() async {
  await Bootstrap.initialize();

  runApp(ProviderScope(child: const ConstellationApp()));
}