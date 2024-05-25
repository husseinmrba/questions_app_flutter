import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questions_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:questions_app/models/question_model.dart';

class LeadingQuestion extends StatelessWidget {
  const LeadingQuestion({
    super.key,
    required this.question,
  });

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0xff611cdf),
                spreadRadius: 0.1,
              )
            ],
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xff611cdf),
            child: BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected) {
                  return CircleAvatar(
                    radius: 19,
                    backgroundImage: NetworkImage(question
                            .questionOwner.profileImage ??
                        'https://www.kindpng.com/picc/m/33-338711_circle-user-icon-blue-hd-png-download.png'),
                  );
                } else {
                  return const CircleAvatar(
                    radius: 19,
                    backgroundImage:
                        AssetImage('assets/images/defualtImage.png'),
                  );
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SizedBox(
            width: 40,
            child: Center(
              child: Text(
                overflow: TextOverflow.ellipsis,
                question.questionOwner.fullName,
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
