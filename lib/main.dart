import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/internet_cubit/internet_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetCubit()),
        BlocProvider(
          create: (context) => QuestionsCubit(
            repository,
            BlocProvider.of<InternetCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: myRoutes,
        initialRoute: QuestionsView.id,
      ),
    );
  }
}
