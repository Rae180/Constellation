import '../domain/entities/message.dart';

abstract class AIProvider {
  Future<Message> generateResponse({
    required List<Message> messages,
  });
}