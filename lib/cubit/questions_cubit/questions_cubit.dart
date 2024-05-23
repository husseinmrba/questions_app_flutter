import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:questions_app/models/question_model.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());
}
