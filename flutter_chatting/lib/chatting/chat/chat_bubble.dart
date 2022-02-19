import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, {Key? key}) : super(key: key);

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 145.0,
          margin: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 8.0,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12.0),
              topRight: const Radius.circular(12.0),
              bottomLeft: isMe ? const Radius.circular(12.0) : const Radius.circular(0.0),
              bottomRight: isMe ? const Radius.circular(0.0) : const Radius.circular(12.0),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
