import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:questions_app/constants.dart';

class ShowHtml extends StatelessWidget {
  const ShowHtml({
    super.key,
    required this.htmlContent,
  });

  final String htmlContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.withOpacity(0.05),
      padding: const EdgeInsets.all(12),
      child: HtmlWidget(
        htmlContent,
        textStyle: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
