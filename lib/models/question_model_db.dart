import 'package:questions_app/helper/mapping.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/models/question_owner_model.dart';

const String questionsTableName = 'Questions';

class QuestionsFieldsDb {
  // Columns names for questions table
  static const idField = 'id';
  static const idQuestionField = 'idQuestion';
  static const titleField = 'title';
  static const scoreField = 'score';
  static const tagsField = 'tags';
  static const questionOwnerField = 'questionOwner';
  static const bodyField = 'body';

  // Columns types for questions table
  static const idFieldType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const idQuestionFieldType = 'INTEGER NOT NULL';
  static const titleFieldType = 'TEXT NOT NULL';
  static const scoreFieldType = 'INTEGER NOT NULL';
  static const tagsFieldType = 'TEXT NOT NULL';
  static const questionOwnerFieldType = 'TEXT NOT NULL';
  static const bodyFieldType = 'TEXT NOT NULL';
}

class QuestionModelDb implements Mapper<QuestionModelDb, QuestionModel> {
  final int? id;
  final int idQuestion;
  final String title;
  final int score;
  final String tags;
  final String questionOwner;
  final String body;

  QuestionModelDb({
    this.id,
    required this.idQuestion,
    required this.title,
    required this.score,
    required this.tags,
    required this.questionOwner,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      QuestionsFieldsDb.idField: id,
      QuestionsFieldsDb.idQuestionField: idQuestion,
      QuestionsFieldsDb.titleField: title,
      QuestionsFieldsDb.scoreField: score,
      QuestionsFieldsDb.tagsField: tags,
      QuestionsFieldsDb.questionOwnerField: questionOwner,
      QuestionsFieldsDb.bodyField: body,
    };
  }

  factory QuestionModelDb.fromMap(Map<String, dynamic> map) {
    return QuestionModelDb(
      id: map[QuestionsFieldsDb.idField] != null
          ? map[QuestionsFieldsDb.idField] as int
          : null,
      idQuestion: map[QuestionsFieldsDb.idQuestionField] as int,
      title: map[QuestionsFieldsDb.titleField] as String,
      score: map[QuestionsFieldsDb.scoreField] as int,
      tags: map[QuestionsFieldsDb.tagsField] as String,
      questionOwner: map[QuestionsFieldsDb.questionOwnerField] as String,
      body: map[QuestionsFieldsDb.bodyField] as String,
    );
  }

  @override
  QuestionModel mapper(QuestionModelDb object) {
    return QuestionModel(
      id: object.idQuestion,
      title: object.title,
      score: object.score,
      tags: object.tags.split(','),
      questionOwner: QuestionOwnerModel(fullName: object.questionOwner),
      body: object.body,
    );
  }
}
