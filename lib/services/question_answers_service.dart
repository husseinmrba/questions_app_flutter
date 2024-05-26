import 'package:questions_app/constants.dart';
import 'package:questions_app/helper/api.dart';

class QuestionAnswersService{
  Future<List<dynamic>> fetchAnswers(int questionId) async {
    try {
      final response = await Api().get(
        url: '$baseUrl/questions/$questionId/answers?order=desc&sort=activity&site=stackoverflow&filter=!0SnoZ9WyXeYbrtiax16uvYqGT',
      );
      return response['items'] as List<dynamic>;
    } catch (e) {
      return [];
    }
  }
}