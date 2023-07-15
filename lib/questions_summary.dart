import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summarydata, {super.key});
  final List<Map<String, Object>> summarydata;
  Color finalcolor(String correctanswer, String useranswer) {
    if (correctanswer == useranswer) {
      return const Color.fromARGB(255, 150, 198, 241);
    } else {
      return const Color.fromARGB(255, 249, 133, 241);
    }
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: finalcolor(data['correctanswer'].toString(),
                          data['useranswer'].toString()),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    ((data["question index"] as int) + 1).toString(),
                    style: const TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 32, 3, 93)),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.tiltNeon(
                            color: Colors.white, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['correctanswer'] as String,
                        style: GoogleFonts.tiltNeon(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['useranswer'].toString(),
                        style: GoogleFonts.tiltNeon(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
