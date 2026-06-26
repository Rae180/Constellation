import '../domain/entities/message.dart';
import '../memory/chat_memory.dart';
import 'ai_provider.dart';

class AIEngine {
  final AIProvider provider;
  final ChatMemory memory;

  AIEngine({
    required this.provider,
    required this.memory,
  });

  Future<Message> process({
    required List<Message> messages,
  }) async {
    final trimmed = memory.applyWindow(messages);

    return provider.generateResponse(
      messages: trimmed,
    );
  }
}