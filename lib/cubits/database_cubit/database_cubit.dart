import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:questions_app/models/question_model_db.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());

  Database? database;
  static const String _databaseName = 'Questions.db';
  static const int _databaseVersion = 1;

  Future<void> initDatabase() async {
    String dbPath = await getDatabasesPath();
    final String path = join(dbPath, _databaseName);
    database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDB,
    );
  }

   //! Create Database method
  Future _createDB(
    Database db,
    int version,
  ) async {
    
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $questionsTableName (
        ${QuestionsFieldsDb.idField} ${QuestionsFieldsDb.idFieldType},
        ${QuestionsFieldsDb.idQuestionField} ${QuestionsFieldsDb.idQuestionFieldType},
        ${QuestionsFieldsDb.titleField} ${QuestionsFieldsDb.titleFieldType},
        ${QuestionsFieldsDb.scoreField} ${QuestionsFieldsDb.scoreFieldType},
        ${QuestionsFieldsDb.tagsField} ${QuestionsFieldsDb.tagsFieldType},
        ${QuestionsFieldsDb.questionOwnerField} ${QuestionsFieldsDb.questionOwnerFieldType},
        ${QuestionsFieldsDb.bodyField} ${QuestionsFieldsDb.bodyFieldType},
      )
      ''');
  }
}