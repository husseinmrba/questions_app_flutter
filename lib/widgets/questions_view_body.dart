import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:questions_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:questions_app/cubits/questions_cubit/questions_cubit.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/questions_list_view.dart';

class QuestionsViewBody extends StatefulWidget {
  const QuestionsViewBody({
    super.key,
  });

  @override
  State<QuestionsViewBody> createState() => _QuestionsViewBodyState();
}

class _QuestionsViewBodyState extends State<QuestionsViewBody> {
  @override
  void initState() {
    BlocProvider.of<InternetCubit>(context).checkConnectivity();
    BlocProvider.of<InternetCubit>(context).trackConnectivityChange();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<InternetCubit>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state1) {
        if (state1 is InternetConnected) {
          return BlocBuilder<QuestionsCubit, QuestionsState>(
              builder: (context, state) {
            if (state is QuestionsLoading && state.isFirstFetch) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: SpinKitThreeBounce(
                  color: Color(0xff611cdf),
                  size: 40,
                ),
              );
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
          });
        } else {
          return Center(child: Text('Not internet'));
        }
      },
    );
  }
}
