import 'package:flutter/material.dart';

class SubTitleQuestion extends StatelessWidget {
  const SubTitleQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0),
      child: SizedBox(
        height: 15,
        child: Chip(
          padding: EdgeInsets.zero,
          label:const  Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Flutter1',
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
