import 'package:flutter/material.dart';
import 'package:questions_app/constants.dart';

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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
              ),
            ),
          ),
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
