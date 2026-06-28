import 'package:constellation/core/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/chat_controller.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    _controller.clear();

    await ref.read(conversationControllerProvider.notifier).sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(conversationControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Constellation Chat"),
      actions: [
        IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        ref.read(conversationControllerProvider.notifier).newConversation();
      },
    ),
      ],),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.activeMessages.length,
              itemBuilder: (context, index) {
                final message = state.activeMessages[index];

                return ListTile(
                  leading: Icon(
                    message.role == MessageRole.user
                        ? Icons.person
                        : Icons.smart_toy,
                  ),
                  title: Text(message.content),
                  subtitle: Text(message.role.name),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type something...",
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
