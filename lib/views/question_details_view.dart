import 'package:flutter/material.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/custom_app_bar.dart';
import 'package:questions_app/widgets/custom_card.dart';
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
    return  Scaffold(
      body: Column(
        children: [
           const CustomAppBar(),
           const TitleView(
            title: 'Question Details',
          ),
          CustomCard(
            question: question,
          ),
        ],
      ),
    );
  }
}
