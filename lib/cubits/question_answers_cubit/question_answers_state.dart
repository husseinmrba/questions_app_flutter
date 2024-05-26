part of 'question_answers_cubit.dart';

@immutable
sealed class QuestionAnswersState {}

final class QuestionAnswersInitial extends QuestionAnswersState {}

final class QuestionAnswersLoading extends QuestionAnswersState {}

final class QuestionAnswersLoaded extends QuestionAnswersState {
  final List<QuestionAnswerModel> answersList;

  QuestionAnswersLoaded({required this.answersList});
}
