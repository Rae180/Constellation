import 'dart:async';
import 'package:constellation/app/bootstrap/dependency_injection.dart';
import 'package:constellation/core/ai/ai_engine.dart';
import 'package:constellation/core/domain/entities/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'chat_state.dart';

final chatControllerProvider =
    NotifierProvider<ChatController, ChatState>(
  ChatController.new,
);

class ChatController extends Notifier<ChatState> {
  final _uuid = const Uuid();

  @override
  ChatState build() {
    return const ChatState();
  }

  Future<void> sendMessage(String text) async {
  final trimmed = text.trim();
  if (trimmed.isEmpty) return;

  final userMessage = Message(
    id: _uuid.v4(),
    content: trimmed,
    timestamp: DateTime.now(),
    role: MessageRole.user,
  );

  state = state.copyWith(
    messages: [...state.messages, userMessage],
  );

  final aiEngine = getIt<AIEngine>();

  final response = await aiEngine.process(
    messages: state.messages,
  );

  state = state.copyWith(
    messages: [...state.messages, response],
  );
}
}