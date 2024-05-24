import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/repositories/questions_repository.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit(this.questionsRepository) : super(QuestionsInitial());

  int page = 1;
  final QuestionsRepository questionsRepository;

  void loadQuestions() {
    if (state is QuestionsLoading) {
      return;
    }

    final currentState = state;
    var oldQuestions = <QuestionModel>[];
    if (currentState is QuestionsLoaded) {
      oldQuestions = currentState.questionsList;
    }

    emit(
      QuestionsLoading(
        oldQuestions,
        isFirstFetch: page == 1,
      ),
    );

    questionsRepository.fetchQuestions(page).then((newQuestions) {
      page++;

      final questions = (state as QuestionsLoading).oldQuestionsList;
      questions.addAll(newQuestions);
      emit(
        QuestionsLoaded(
          questionsList: questions,
        ),
      );
    });
  }
}
