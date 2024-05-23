import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/sub_title_question.dart';

class SubTitleQuestionListView extends StatelessWidget {
  const SubTitleQuestionListView({
    super.key,
    required this.question,
  });

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      padding: const EdgeInsets.only(
        right: 100,
        top: 8,
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: question.tags.length,
          itemBuilder: (context, index) {
            return SubTitleQuestion(
              tag: question.tags[index],
            );
          }),
    );
  }
}
