import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/sub_title_question.dart';
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
      leading: Column(
        children: [
          Container(
            decoration: BoxDecoration(
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
              backgroundColor: Color(0xff611cdf),
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
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      title: Text(
        question.title,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      subtitle: Container(
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
      ),
      trailing: TrailingQuestion(
        score: question.score,
      ),
    );
  }
}
