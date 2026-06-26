import 'package:logger/logger.dart' as l;

import 'log_level.dart';

class LoggerService {
  final l.Logger _logger;

  LoggerService()
      : _logger = l.Logger(
          printer: l.PrettyPrinter(
            methodCount: 0,
            errorMethodCount: 5,
            lineLength: 80,
          ),
        );

  void log(
    String message, {
    LogLevel level = LogLevel.info,
    Object? error,
    StackTrace? stackTrace,
  }) {
    switch (level) {
      case LogLevel.debug:
        _logger.d(message);
        break;
      case LogLevel.info:
        _logger.i(message);
        break;
      case LogLevel.warning:
        _logger.w(message);
        break;
      case LogLevel.error:
        _logger.e(message, error: error, stackTrace: stackTrace);
        break;
    }
  }
}