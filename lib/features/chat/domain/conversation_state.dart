import '../../../../core/domain/entities/message.dart';

class ConversationState {
  final String activeConversationId;
  final Map<String, List<Message>> conversations;

  const ConversationState({
    required this.activeConversationId,
    required this.conversations,
  });

  List<Message> get activeMessages =>
      conversations[activeConversationId] ?? [];

  ConversationState copyWith({
    String? activeConversationId,
    Map<String, List<Message>>? conversations,
  }) {
    return ConversationState(
      activeConversationId:
          activeConversationId ?? this.activeConversationId,
      conversations: conversations ?? this.conversations,
    );
  }
}