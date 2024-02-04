import 'package:flutter/material.dart';
import 'package:quizz/answer_button.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                      color: Colors.amber,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                ...currentQuestion.getShuffledAnswers().map((answer) {
                  return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
