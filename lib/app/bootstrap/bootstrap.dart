import 'package:flutter/widgets.dart';

class Bootstrap {
  const Bootstrap._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Future:
    // Logger
    // Storage
    // Providers
    // Services

    await Future<void>.delayed(Duration.zero);
  }
}