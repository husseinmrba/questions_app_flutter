import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';

class LeadingQuestion extends StatelessWidget {
  const LeadingQuestion({
    super.key,
    required this.question,
  });

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0xff611cdf),
                spreadRadius: 0.1,
              )
            ],
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor:const  Color(0xff611cdf),
            child: CircleAvatar(
              radius: 19,
              backgroundImage:
                  NetworkImage(question.questionOwner.profileImage),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SizedBox(
            width: 40,
            child: Center(
              child: Text(
                overflow: TextOverflow.ellipsis,
                question.questionOwner.fullName,
                style:const  TextStyle(
                  fontSize: 9,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
