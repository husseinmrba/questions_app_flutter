import 'package:flutter/material.dart';
import 'package:questions_app/widgets/custom_app_bar.dart';
import 'package:questions_app/widgets/questions_view_body.dart';
import 'package:questions_app/widgets/show_my_plugin.dart';
import 'package:questions_app/widgets/title_view.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  static String id = 'QuestionsView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          TitleView(
            title: 'All Questions',
          ),
          QuestionsViewBody(),
        ],
      ),
      floatingActionButton: ShowMyPlugin(),
    );
  }
}
