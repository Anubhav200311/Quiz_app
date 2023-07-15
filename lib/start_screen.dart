//import 'package:adv_basic/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:adv_basic/quiz.dart';

// ignore: camel_case_types
class start_screen extends StatelessWidget {
  const start_screen(this.startquiz, {super.key});
  final void Function() startquiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        //const Text("Start Screen"),
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
        ),
        const SizedBox(height: 80),
        Text(
          "Learn Flutter The Fun Way!!!",
          style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 25),
        ),
        OutlinedButton.icon(
          onPressed: () {
            startquiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_forward),
          label: const Text("Start Quiz"),
        )
      ]),
    );
  }
}
