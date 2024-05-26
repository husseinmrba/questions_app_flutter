import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/question_answers_cubit/question_answers_cubit.dart';
import 'package:questions_app/widgets/custom_progress_indicator.dart';
import 'package:questions_app/widgets/show_html.dart';

class QuestionDetailsViewBody extends StatelessWidget {
  const QuestionDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionAnswersCubit, QuestionAnswersState>(
        builder: (context, state) {
      if (state is QuestionAnswersLoaded) {
        var answers = state.answersList;
        if (answers.isNotEmpty) {
          return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemBuilder: (context, index) {
                return ShowHtml(
                  htmlContent: answers[index].bodyAnswer,
                );
              });
        } else {
          return const Center(
            child: Text('Sorry not found answers'),
          );
        }
      } else {
        return const CustomProgressIndicator();
      }
    });
  }
}
