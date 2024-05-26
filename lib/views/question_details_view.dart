import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/widgets/custom_app_bar.dart';
import 'package:questions_app/widgets/custom_card.dart';
import 'package:questions_app/widgets/title_view.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

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
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          CustomCard(
            question: question,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TitleView(
                      title: 'Question Details',
                    ),
                    Divider(),
                    Container(
                      color: Color(0xff611cdf).withOpacity(0.05),
                      padding: EdgeInsets.all(12),
                      child: HtmlWidget(
                        question.body,
                        textStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Divider(),
                    const TitleView(
                      title: 'Answers',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
