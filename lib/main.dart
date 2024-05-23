import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubit/questions_cubit/questions_cubit.dart';
import 'package:questions_app/routes.dart';
import 'package:questions_app/views/questions_view.dart';

void main() {
  runApp(const QuestionsApp());
}

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: myRoutes,
        initialRoute: QuestionsView.id,
      ),
    );
  }
}
