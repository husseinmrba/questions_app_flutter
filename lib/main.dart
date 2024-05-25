import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/database_cubit/database_cubit.dart';
import 'package:questions_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:questions_app/cubits/questions_cubit/questions_cubit.dart';
import 'package:questions_app/repositories/questions_repository.dart';
import 'package:questions_app/repositories/questions_repository_db.dart';
import 'package:questions_app/routes.dart';
import 'package:questions_app/services/questions_service.dart';
import 'package:questions_app/views/questions_view.dart';

void main() {
  runApp(
    QuestionsApp(
      questionsRepository: QuestionsRepository(QuestionsService()),
    ),
  );
}

class QuestionsApp extends StatelessWidget {
  const QuestionsApp({
    super.key,
    required this.questionsRepository,
  });
  final QuestionsRepository questionsRepository;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetCubit()..checkConnectivity()),
        BlocProvider(create: (context) => DatabaseCubit()..initDatabase()),
        BlocProvider(
          create: (context) => QuestionsCubit(
            questionsRepository,
            BlocProvider.of<InternetCubit>(context),
            QuestionsRepositoryDb(
              databaseCubit: BlocProvider.of<DatabaseCubit>(context),
            ),
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
