import 'package:adv_basic/data/questions.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:adv_basic/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenanswers, required this.restartscreen});
  final List<String> chosenanswers;
  final void Function() restartscreen;
  List<Map<String, Object>> getsummarydata() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswers.length; i++) {
      summary.add({
        'question index': i,
        'question': questions[i].text,
        'correctanswer': questions[i].answer[0],
        'useranswer': chosenanswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summarydata = getsummarydata();
    final numtotalquestions = questions.length;
    final numcorrecctquestions = summarydata.where((data) {
      return data['useranswer'] == data['correctanswer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You Answered $numcorrecctquestions out of $numtotalquestions questions Correctly ",
              style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartscreen,
              icon: const Icon(Icons.restart_alt_sharp),
              label: const Text("Restart Quiz"),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
