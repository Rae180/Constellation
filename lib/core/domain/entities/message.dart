enum MessageRole {
  user,
  assistant,
  system,
}

class Message {
  final String id;
  final String content;
  final DateTime timestamp;
  final MessageRole role;

  const Message({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.role,
  });

  Message copyWith({
    String? id,
    String? content,
    DateTime? timestamp,
    MessageRole? role,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      role: role ?? this.role,
    );
  }
}