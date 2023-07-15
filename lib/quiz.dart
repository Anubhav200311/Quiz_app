import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/questions_screen.dart';
import 'package:adv_basic/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quizstate();
  }
}

class _Quizstate extends State<Quiz> {
  List<String> selectedanswers = [];
  var activescreen = "Start-Screen";

  void switchscreen() {
    setState(() {
      activescreen = "Question-Screen";
    });
  }

  void restartscreen() {
    setState(() {
      selectedanswers = [];
      activescreen = 'Start-Screen';
    });
  }

  void chooseanswer(String Answer) {
    selectedanswers.add(Answer);
    if (selectedanswers.length == questions.length) {
      setState(() {
        activescreen = "Result-Screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenwidget = start_screen(switchscreen);
    if (activescreen == "Question-Screen") {
      screenwidget = Questionscreen(
        onselectanswer: chooseanswer,
      );
    }
    if (activescreen == "Result-Screen") {
      screenwidget = ResultScreen(
        chosenanswers: selectedanswers,
        restartscreen: restartscreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(0, 27, 8, 123),
                Color.fromARGB(255, 11, 56, 104)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
