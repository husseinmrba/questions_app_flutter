import 'package:flutter/material.dart';

class TrailingQuestion extends StatelessWidget {
  const TrailingQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.zero,
      label: const Text(
        '2 Score',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      backgroundColor: Colors.blueGrey,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
