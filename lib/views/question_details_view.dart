import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/question_answers_cubit/question_answers_cubit.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/custom_app_bar.dart';
import 'package:questions_app/widgets/custom_card.dart';
import 'package:questions_app/widgets/question_details_view_body.dart';
import 'package:questions_app/widgets/show_html.dart';
import 'package:questions_app/widgets/title_view.dart';

class QuestionDetailsView extends StatefulWidget {
  const QuestionDetailsView({super.key});
  static String id = 'QuestionDetailsView';
  @override
  State<QuestionDetailsView> createState() => _QuestionDetailsViewState();
}

class _QuestionDetailsViewState extends State<QuestionDetailsView> {
  late QuestionModel question;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    question = ModalRoute.of(context)!.settings.arguments as QuestionModel;
    BlocProvider.of<QuestionAnswersCubit>(context).loadAnswers(question.id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            CustomCard(
              question: question,
            ),
            const TitleView(
              title: 'Question Details',
            ),
            ShowHtml(
              htmlContent: question.body,
            ),
            const TitleView(
              title: 'Answers',
            ),
            const QuestionDetailsViewBody(),
          ],
        ),
      ),
    );
  }
}
