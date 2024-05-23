import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubit/questions_cubit/questions_cubit.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/questions_list_view.dart';

class QuestionsViewBody extends StatelessWidget {
  const QuestionsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {

      if (state is QuestionsLoading && state.isFirstFetch) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      List<QuestionModel> questions = [];
      if (state is QuestionsLoading) {
        questions = state.oldQuestionsList;
      } else if (state is QuestionsLoaded) {
        questions = state.questionsList;
      }
      return Expanded(
        child: QuestionsListView(
          questionsList: questions,
        ),
      );
    });
  }
}
