import 'package:flutter/material.dart';

class TrailingQuestion extends StatelessWidget {
  const TrailingQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.arrow_upward,
            size: 16,
          ),
        ),
        Text(
          '2',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleAvatar(
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
