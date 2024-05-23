import 'package:flutter/material.dart';
import 'package:questions_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: kMyGradientColors,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Stack Overflow',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: 20,
          right: MediaQuery.of(context).size.width * 0.3,
          child: const Text(
            'Hi, Welcome to Stack Overflow Questions App',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
