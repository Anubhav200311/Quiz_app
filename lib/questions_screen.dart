//import 'package:adv_basic/models/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'package:adv_basic/answer_button.dart';
import 'package:adv_basic/data/questions.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key, required this.onselectanswer});
  final void Function(String answer) onselectanswer;
  @override
  State<Questionscreen> createState() {
    return _QuestionscreenState();
  }
}

class _QuestionscreenState extends State<Questionscreen> {
  var currentquestionindex = 0;

  void answerquestion(String answer) {
    widget.onselectanswer(answer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.getShuffledAnswers().map((item) {
              const SizedBox(
                height: 10,
              );
              return AnswerButton(
                answertext: item,
                onTap: () {
                  answerquestion(item);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
