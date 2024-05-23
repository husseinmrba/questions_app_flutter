import 'package:flutter/material.dart';
import 'package:questions_app/widgets/question_item.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: 10,
      itemBuilder: (context, index) {
        return const QuestionItem();
      },
    );
  }
}
