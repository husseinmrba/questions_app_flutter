import 'package:questions_app/helper/mapping.dart';
import 'package:questions_app/models/question_model_db.dart';
import 'package:questions_app/models/question_owner_model.dart';

class QuestionModel implements Mapper<QuestionModel, QuestionModelDb> {
  final int id;
  final String title;
  final int score;
  final List<String> tags;
  final int? creationDate;
  final QuestionOwnerModel questionOwner;
  final String body;

  QuestionModel({
    required this.id,
    required this.title,
    required this.score,
    required this.tags,
    this.creationDate,
    required this.questionOwner,
    required this.body,
  });

  QuestionModel.fromJson(Map jsonData)
      : id = jsonData['question_id'],
        title = jsonData['title'],
        score = jsonData['score'],
        tags =
            (jsonData['tags'] as List).map((item) => item as String).toList(),
        creationDate = jsonData['creation_date'],
        questionOwner = QuestionOwnerModel.fromJson(jsonData['owner']),
        body = jsonData['body'];

  @override
  QuestionModelDb mapper(QuestionModel object) {
    return QuestionModelDb(
      idQuestion: object.id,
      title: object.title,
      score: object.score,
      tags: object.tags.join(','),
      questionOwner: object.questionOwner.fullName,
      body: object.body,
    );
  }
}
