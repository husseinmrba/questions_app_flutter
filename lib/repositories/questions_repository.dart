import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/services/questions_service.dart';

class QuestionsRepository {
  final QuestionsService questionsService;

  QuestionsRepository(this.questionsService);
  Future<List<QuestionModel>> fetchQuestions(int page) async {
    final questions = await questionsService.fetchQuestions(page);
    return questions.map((q) => QuestionModel.fromJson(q)).toList();
  }
}
