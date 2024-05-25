import 'package:questions_app/cubits/database_cubit/database_cubit.dart';
import 'package:questions_app/models/question_model_db.dart';

class QuestionsRepositoryDb {
  final DatabaseCubit _databaseCubit;

  QuestionsRepositoryDb({required DatabaseCubit databaseCubit})
      : _databaseCubit = databaseCubit;

  //! C --> CRUD = Create
  Future<void> postQuentionDb(QuestionModelDb questionModelDb) async {
    await _databaseCubit.database?.insert(
      questionsTableName,
      questionModelDb.toMap(),
    );
  }

  // Get All Questions
  Future<List<QuestionModelDb>> fetchAllQuestions(int page) async {
    final result = await _databaseCubit.database?.query(
      questionsTableName,
      orderBy: '${QuestionsFieldsDb.idField} DESC',
      limit: 15,
      offset: page,
    );

    if (result != null && result.isNotEmpty) {
      return result.map((qDb) => QuestionModelDb.fromMap(qDb)).toList();
    } else {
      return <QuestionModelDb>[];
    }
  }
}
