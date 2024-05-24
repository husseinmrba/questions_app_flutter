import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/questions_cubit/questions_cubit.dart';
import 'package:questions_app/repositories/questions_repository.dart';
import 'package:questions_app/routes.dart';
import 'package:questions_app/services/questions_service.dart';
import 'package:questions_app/views/questions_view.dart';

void main() {
  runApp(
    QuestionsApp(
      repository: QuestionsRepository(
        QuestionsService(),
      ),
    ),
  );
}

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({super.key, required this.repository});
  final QuestionsRepository repository;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsCubit(repository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: myRoutes,
        initialRoute: QuestionsView.id,
      ),
    );
  }
}
