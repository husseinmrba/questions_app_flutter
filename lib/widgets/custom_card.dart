import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/question_item.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.question});
  final QuestionModel question;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 5,
          color: Colors.grey.withOpacity(.09),
          spreadRadius: 0,
          offset: const Offset(2, 2),
        ),
      ]),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 5,
        color: Colors.white,
        child: QuestionItem(
          question: question,
        ),
      ),
    );
  }
}
