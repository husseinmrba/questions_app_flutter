import 'package:questions_app/constants.dart';
import 'package:questions_app/helper/api.dart';

class QuestionsService {
  static const fetchLimit = 15;

  Future<List<dynamic>> fetchQuestions(int page) async {
    try {
      final response = await Api().get(
        url: '$baseUrl/questions?page=$page&pagesize=$fetchLimit&order=desc&sort=activity&tagged=flutter;dart;bloc&site=stackoverflow&filter=!4(sMpkA4mjX9HHLwA',
      );
      return response['items'] as List<dynamic>;
    } catch (e) {
      return [];
    }
  }
}
