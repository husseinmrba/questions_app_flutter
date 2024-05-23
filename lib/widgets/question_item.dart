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
      leading: const Column(
        children: [
          CircleAvatar(
            radius: 19,
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            child: Text('2'),
          ),
          Text(
            'Hussein issa',
            style: TextStyle(
              fontSize: 9,
              color: Colors.grey,
            ),
          )
        ],
      ),
      title: const Text('Hello I am Hussein from Syria How are you'),
      subtitle: Container(
        height: 15,
        padding: const EdgeInsets.only(right: 100),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const SubTitleQuestion();
            }),
      ),
      trailing: const TrailingQuestion(),
    );
  }
}
