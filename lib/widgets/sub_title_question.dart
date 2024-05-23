import 'package:flutter/material.dart';

class SubTitleQuestion extends StatelessWidget {
  const SubTitleQuestion({
    super.key,
    required this.tag,
  });
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0),
      child: SizedBox(
        height: 15,
        child: Chip(
          padding: EdgeInsets.zero,
          label: Align(
            alignment: Alignment.topCenter,
            child: Text(
              tag,
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
              ),
            ),
          ),
          backgroundColor: const Color(0xff9b5acf),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
