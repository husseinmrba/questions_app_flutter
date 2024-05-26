import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:questions_app/cubits/questions_cubit/questions_cubit.dart';
import 'package:questions_app/models/question_model.dart';
import 'package:questions_app/views/question_details_view.dart';
import 'package:questions_app/widgets/custom_card.dart';

class QuestionsListView extends StatefulWidget {
  const QuestionsListView({
    super.key,
    required this.questionsList,
    required this.isLoading,
  });
  final List<QuestionModel> questionsList;
  final bool isLoading;

  @override
  State<QuestionsListView> createState() => _QuestionsListViewState();
}

class _QuestionsListViewState extends State<QuestionsListView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    setupScrollController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 1);
      },
      itemCount: widget.questionsList.length + (widget.isLoading ? 1 : 0),
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index < widget.questionsList.length) {
          var question = widget.questionsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(QuestionDetailsView.id);
            },
            child: CustomCard(
              question: question,
            ),
          );
        } else {
          Timer(const Duration(milliseconds: 30), () {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          });

          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: SpinKitThreeBounce(
              color: Color(0xff611cdf),
              size: 40,
            ),
          );
        }
      },
    );
  }

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        BlocProvider.of<QuestionsCubit>(context).loadQuestions();
      }
    });
  }
}
