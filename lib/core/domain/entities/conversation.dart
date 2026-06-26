import 'message.dart';

class Conversation {
  final String id;
  final String title;
  final List<Message> messages;
  final DateTime createdAt;

  const Conversation({
    required this.id,
    required this.title,
    required this.messages,
    required this.createdAt,
  });

  Conversation copyWith({
    String? id,
    String? title,
    List<Message>? messages,
    DateTime? createdAt,
  }) {
    return Conversation(
      id: id ?? this.id,
      title: title ?? this.title,
      messages: messages ?? this.messages,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Conversation addMessage(Message message) {
    return copyWith(
      messages: [...messages, message],
    );
  }
}