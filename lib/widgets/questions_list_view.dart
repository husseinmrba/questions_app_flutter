import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/custom_card.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({
    super.key,
    required this.questionsList,
  });

  final List<QuestionModel> questionsList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 1);
      },
      itemCount: questionsList.length,
      itemBuilder: (context, index) {
        return const CustomCard();
      },
    );
  }
}
