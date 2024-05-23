part of 'questions_cubit.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {
  final List<QuestionModel> oldQuestionList;
  final bool isFirstFetch;

  QuestionsLoading(
    this.oldQuestionList, {
    this.isFirstFetch = false,
  });
}

final class QuestionsLoaded extends QuestionsState {
  final List<QuestionModel> questionList;

  QuestionsLoaded({required this.questionList});
}
