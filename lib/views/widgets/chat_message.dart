import 'package:flutter/material.dart';
import 'package:ai_assistant/models/chat_message.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: ((message.getIsSentByUser())
            ? Alignment.bottomRight
            : Alignment.bottomLeft),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Colors.grey[500]!,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            message.getText(),
            style: TextStyle(
              color: (message.getIsError() ? Colors.red : Color.fromARGB(255, 66, 133, 244)),
            ),
          ),
        ),
      ),
    );
  }
}
