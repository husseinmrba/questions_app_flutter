import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/database_cubit/database_cubit.dart';
import 'package:questions_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:questions_app/cubits/questions_cubit/questions_cubit.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/custom_progress_indicator.dart';
import 'package:questions_app/widgets/questions_list_view.dart';

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({
    super.key,
  });

  @override
  State<QuestionsViewBody> createState() => _QuestionsViewBodyState();
}

class _QuestionsViewBodyState extends State<QuestionsViewBody> {
  late InternetCubit _internetCubit;
  late QuestionsCubit _questionsCubit;
  @override
  void initState() {
    _internetCubit = BlocProvider.of<InternetCubit>(context);
    _questionsCubit = BlocProvider.of<QuestionsCubit>(context);
    _internetCubit.trackConnectivityChange();
    super.initState();
  }

  @override
  void dispose() {
    _internetCubit.dispose();
    _questionsCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseCubit, DatabaseState>(
      listener: (context, state) {
        if (state is DatabaseLoaded) {
          _questionsCubit.loadQuestions();
        }
      },
      child: BlocBuilder<QuestionsCubit, QuestionsState>(
          builder: (context, state) {
        if (state is QuestionsLoading && state.isFirstFetch) {
          return const CustomProgressIndicator();
        }

        List<QuestionModel> questions = [];
        bool isLoading = false;
        if (state is QuestionsLoading) {
          questions = state.oldQuestionsList;
          isLoading = true;
        } else if (state is QuestionsLoaded) {
          questions = state.questionsList;
        }
        return Expanded(
          child: QuestionsListView(
            questionsList: questions,
            isLoading: isLoading,
          ),
        );
      }),
    );
  }
}


