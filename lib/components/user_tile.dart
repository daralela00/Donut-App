import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            const Icon(Icons.person, color: Color.fromRGBO(100, 0, 0, 1)),

            const SizedBox(width: 10),

            Text(
              text,
              style: const TextStyle(
                color: Color.fromRGBO(100, 0, 0, 1),
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}