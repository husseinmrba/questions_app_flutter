import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:questions_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/repositories/questions_repository.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit(
    this.questionsRepository,
    this._internetCubit,
  ) : super(QuestionsInitial()) {
    listeningStatesInternet();
  }

  int page = 1;
  final QuestionsRepository questionsRepository;
  final InternetCubit _internetCubit;
  late final StreamSubscription _internetCubitSubscription;
  bool _isConnected = true;

  void listeningStatesInternet() {
    _internetCubitSubscription = _internetCubit.stream.listen((state) {
      if (state is InternetConnected) {
        _isConnected = true;
        log('isConnected = true');
      } else {
        _isConnected = false;
        log('isConnected = false');
      }
    });
  }

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
    if (_isConnected) {
      log('Hussein Issa connected');
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
    } else {
      log('Hussein Issa not connected');
      final questions = (state as QuestionsLoading).oldQuestionsList;

      emit(
        QuestionsLoaded(
          questionsList: questions,
        ),
      );
    }
  }

  Future<void> dispose() {
    _internetCubitSubscription.cancel();
    return super.close();
  }
}
