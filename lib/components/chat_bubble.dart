import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrenstUser;


  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrenstUser
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isCurrenstUser ? const Color.fromRGBO(100, 0, 0, 1) : Colors.red,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}