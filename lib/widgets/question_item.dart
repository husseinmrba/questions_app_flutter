import 'package:flutter/material.dart';
import 'package:questions_app/widgets/sub_title_question.dart';
import 'package:questions_app/widgets/trailing_question.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        child: Text('2'),
      ),
      title: const Text('Hello I am Hussein from Syria'),
      subtitle: SubTitleQuestion(),
      trailing: TrailingQuestion(),
    );
  }
}
