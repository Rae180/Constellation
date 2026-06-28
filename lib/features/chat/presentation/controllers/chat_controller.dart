import 'package:constellation/core/ai/ai_engine.dart';
import 'package:constellation/features/chat/domain/conversation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/domain/entities/message.dart';
import '../../../../app/bootstrap/dependency_injection.dart';

final conversationControllerProvider =
    NotifierProvider<ConversationController, ConversationState>(
  ConversationController.new,
);

class ConversationController extends Notifier<ConversationState> {
  final _uuid = const Uuid();

  @override
  ConversationState build() {
    final id = _uuid.v4();

    return ConversationState(
      activeConversationId: id,
      conversations: {
        id: [],
      },
    );
  }

  void newConversation() {
    final id = _uuid.v4();

    state = state.copyWith(
      activeConversationId: id,
      conversations: {
        ...state.conversations,
        id: [],
      },
    );
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

    final updatedMessages = [
      ...state.activeMessages,
      userMessage,
    ];

    _updateActiveConversation(updatedMessages);

    final aiEngine = getIt<AIEngine>();

    final response = await aiEngine.process(
      messages: updatedMessages,
    );

    _updateActiveConversation([
      ...updatedMessages,
      response,
    ]);
  }

  void _updateActiveConversation(List<Message> messages) {
    final updated = Map<String, List<Message>>.from(
      state.conversations,
    );

    updated[state.activeConversationId] = messages;

    state = state.copyWith(
      conversations: updated,
    );
  }
}