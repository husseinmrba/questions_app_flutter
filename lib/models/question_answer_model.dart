class QuestionAnswerModel {
  final bool isAccepted;
  final int score;
  final String bodyAnswer;

  QuestionAnswerModel({
    required this.isAccepted,
    required this.score,
    required this.bodyAnswer,
  });

  QuestionAnswerModel.fromJson(Map jsonData)
      : isAccepted = jsonData['is_accepted'],
        score = jsonData['score'],
        bodyAnswer = jsonData['body'];
}
