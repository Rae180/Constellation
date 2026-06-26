import 'dart:async';
import 'package:uuid/uuid.dart';

import '../domain/entities/message.dart';
import 'ai_provider.dart';

class MockAIProvider implements AIProvider {
  final _uuid = const Uuid();

  @override
  Future<Message> generateResponse({
    required List<Message> messages,
  }) async {
    await Future.delayed(const Duration(milliseconds: 600));

    final lastUserMessage = messages.lastWhere(
      (m) => m.role == MessageRole.user,
    );

    return Message(
      id: _uuid.v4(),
      content: "Echo AI: ${lastUserMessage.content}",
      timestamp: DateTime.now(),
      role: MessageRole.assistant,
    );
  }
}