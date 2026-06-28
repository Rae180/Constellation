import 'package:constellation/core/ai/ai_engine.dart';
import 'package:constellation/core/ai/mock_ai_provider.dart';
import 'package:constellation/core/memory/chat_memory.dart';
import 'package:constellation/core/services/logger/logger_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  const DependencyInjection._();
  LoggerService get logger => getIt<LoggerService>();

  static Future<void> initialize() async {
    // Core services will be registered here later
     getIt.registerLazySingleton<LoggerService>(
    () => LoggerService(),
  );

  getIt.registerLazySingleton<AIEngine>(
  () => AIEngine(
    provider: MockAIProvider(),
    memory: getIt<ChatMemory>(),
  ),
);

getIt.registerLazySingleton<ChatMemory>(
  () => ChatMemory(),
);

getIt.registerLazySingleton<MockAIProvider>(
  () => MockAIProvider(),
);

    // Example structure (NOT IMPLEMENTED YET):
    // getIt.registerSingleton<Logger>(Logger());
    // getIt.registerSingleton<Storage>(Storage());

    await Future<void>.delayed(Duration.zero);
  }
}