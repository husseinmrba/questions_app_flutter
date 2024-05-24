part of 'questions_cubit.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {
  final List<QuestionModel> oldQuestionsList;
  final bool isFirstFetch;

  QuestionsLoading(
    this.oldQuestionsList, {
    this.isFirstFetch = false,
  });
}

final class QuestionsLoaded extends QuestionsState {
  final List<QuestionModel> questionsList;

  QuestionsLoaded({required this.questionsList});
}
