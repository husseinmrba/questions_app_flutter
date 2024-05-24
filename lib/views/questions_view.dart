import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:questions_app/cubits/questions_cubit/questions_cubit.dart';
import 'package:questions_app/widgets/custom_app_bar.dart';
import 'package:questions_app/widgets/questions_view_body.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  static String id = 'QuestionsView';
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuestionsCubit>(context).loadQuestions();
    return  Scaffold(
        body: Column(
      children: [
        const CustomAppBar(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'All Questions',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => InternetCubit(),
          child: const QuestionsViewBody(),
        ),
      ],
    ));
  }
}
