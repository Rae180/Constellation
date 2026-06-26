import '../domain/entities/message.dart';
import 'memory_config.dart';

class ChatMemory {
  final MemoryConfig config;

  ChatMemory({
    this.config = const MemoryConfig(),
  });

  List<Message> applyWindow(List<Message> messages) {
    if (messages.length <= config.maxMessages) {
      return messages;
    }

    return messages.sublist(
      messages.length - config.maxMessages,
    );
  }
}