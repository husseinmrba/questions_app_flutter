import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubit/questions_cubit/questions_cubit.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/custom_app_bar.dart';
import 'package:questions_app/widgets/questions_list_view.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  static String id = 'QuestionsView';
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuestionsCubit>(context).loadQuestions();
    return Scaffold(
        body: Column(
      children: [
        const CustomAppBar(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'All Questions',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        BlocBuilder<QuestionsCubit, QuestionsState>(builder: (context, state) {
          if (state is QuestionsLoading && state.isFirstFetch) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
        }),
      ],
    ));
  }
}
