import 'package:flutter/material.dart';

class TrailingQuestion extends StatelessWidget {
  const TrailingQuestion({
    super.key,
    required this.score,
  });
  final int score;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 8,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.arrow_upward,
            size: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
          ),
          child: Text(
            "$score",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const CircleAvatar(
          radius: 8,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.arrow_downward,
            size: 16,
          ),
        ),
      ],
    );
  }
}
