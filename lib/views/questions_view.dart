import 'package:flutter/material.dart';
import 'package:questions_app/widgets/custom_app_bar.dart';
import 'package:questions_app/widgets/questions_view_body.dart';
import 'package:questions_app/widgets/title_view.dart';
import 'package:show_toast_when_fetch_data_api/show_toast_when_fetch_data_api_method_channel.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});
  static String id = 'QuestionsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          CustomAppBar(),
          TitleView(
            title: 'All Questions',
          ),
          QuestionsViewBody(),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await MethodChannelShowToastWhenFetchDataApi().getDataApi();
        },
        child: const Text('Plugin'),
      ),
    );
  }
}
