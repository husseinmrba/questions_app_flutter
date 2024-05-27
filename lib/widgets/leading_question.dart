import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/show_question_owner_image.dart';

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
        ShowQuestionOwnerImage(question: question),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SizedBox(
            width: 40,
            child: Center(
              child: Text(
                overflow: TextOverflow.ellipsis,
                question.questionOwner.fullName,
                style: const TextStyle(
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
