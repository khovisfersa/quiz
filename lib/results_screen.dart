import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/start_quizz.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/questions_summary.dart';
import 'package:quizz/utils/styled_text.dart';

class ResultsScreen extends StatelessWidget {
  // const ResultsScreen(this.switchScreen, {super.key});
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRepeat});

  final void Function() onRepeat;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'question_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  // final void Function() switchScreen;

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['question_answer'] == data['user_answer'] ? true : false;
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              text:
                  "$numCorrectQuestions de $numTotalQuestions respostas corretas",
              color: Colors.white,
              size: 18,
              // textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                onRepeat();
              },
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 146, 98, 230)),
              child: Text(
                'Repetir',
                style: GoogleFonts.lato(color: Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }
}
