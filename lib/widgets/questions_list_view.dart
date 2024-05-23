import 'package:flutter/material.dart';
import 'package:questions_app/widgets/custom_card.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 1);
      },
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomCard();
      },
    );
  }
}
