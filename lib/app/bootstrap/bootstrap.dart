import 'package:constellation/core/services/logger/logger_service.dart';
import 'package:flutter/widgets.dart';
import 'dependency_injection.dart';

class Bootstrap {
  const Bootstrap._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await DependencyInjection.initialize();

    final logger = getIt<LoggerService>();
  logger.log("Constellation Boot Complete 🚀");

    // Future:
    // Logger
    // Storage
    // Providers
    // Services

    await Future<void>.delayed(Duration.zero);
  }
}