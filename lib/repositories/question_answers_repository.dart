import 'package:questions_app/models/question_answer_model.dart';
import 'package:questions_app/services/question_answers_service.dart';

class QuestionAnswersRepository {
  final QuestionAnswersService questionAnswersService;

  QuestionAnswersRepository(this.questionAnswersService);
  Future<List<QuestionAnswerModel>> fetchAnswers(int questionId) async {
    final answers = await questionAnswersService.fetchAnswers(questionId);
    return answers.map((a) => QuestionAnswerModel.fromJson(a)).toList();
  }
}
