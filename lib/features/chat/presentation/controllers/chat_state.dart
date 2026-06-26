
import 'package:constellation/core/domain/entities/message.dart';

class ChatState {
  final List<Message> messages;

  const ChatState({
    this.messages = const [],
  });

  ChatState copyWith({
    List<Message>? messages,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
    );
  }
}