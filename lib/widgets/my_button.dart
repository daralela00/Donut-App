import 'package:flutter/material.dart';

//ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  void Function() onPressed;
  MyButton({
    required this.text,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromARGB(255, 150, 24, 24),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}