import 'package:flutter/material.dart';
import 'package:questions_app/widgets/custom_circle_avatar.dart';

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
        const CustomCircleAvatar(
          icon: Icons.arrow_upward,
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
        const CustomCircleAvatar(
          icon: Icons.arrow_downward,
        ),
      ],
    );
  }
}
