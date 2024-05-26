import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:questions_app/models/question_answer_model.dart';
import 'package:questions_app/repositories/question_answers_repository.dart';

part 'question_answers_state.dart';

class QuestionAnswersCubit extends Cubit<QuestionAnswersState> {
  QuestionAnswersCubit(this.questionAnswersRepository)
      : super(QuestionAnswersInitial());
  final QuestionAnswersRepository questionAnswersRepository;

  void loadAnswers(int questionId) {
    emit(QuestionAnswersLoading());
    questionAnswersRepository.fetchAnswers(questionId).then((answers) {
      emit(QuestionAnswersLoaded(answersList: answers));
    });
  }
}
