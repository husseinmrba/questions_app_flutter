import 'package:questions_app/models/question_owner_model.dart';

class QuestionModel {
  final int id;
  final String title;
  final int score;
  final List<String> tags;
  final DateTime creationDate;
  final QuestionOwnerModel questionOwner;
  final String body;

  QuestionModel({
    required this.id,
    required this.title,
    required this.score,
    required this.tags,
    required this.creationDate,
    required this.questionOwner,
    required this.body,
  });

  QuestionModel.fromJson(Map jsonData)
      : id = jsonData['question_id'],
        title = jsonData['title'],
        score = jsonData['score'],
        tags = jsonData['tags'],
        creationDate = jsonData['creation_date'],
        questionOwner = QuestionOwnerModel.fromJson(jsonData['owner']),
        body = jsonData['body'];
}
