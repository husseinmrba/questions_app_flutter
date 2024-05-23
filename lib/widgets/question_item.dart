import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/leading_question.dart';
import 'package:questions_app/widgets/sub_title_question_list_view.dart';
import 'package:questions_app/widgets/trailing_question.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.question,
  });
  final QuestionModel question;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: LeadingQuestion(
        question: question,
      ),
      title: Text(
        question.title,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      subtitle: SubTitleQuestionListView(
        question: question,
      ),
      trailing: TrailingQuestion(
        score: question.score,
      ),
    );
  }
}
