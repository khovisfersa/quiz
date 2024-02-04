import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/questions_screen.dart';
import 'package:quizz/results_screen.dart';
import 'package:quizz/start_quizz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartQuizz(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = ResultsScreen(
            chosenAnswers: selectedAnswers, onRepeat: restartQuiz);
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = StartQuizz(switchScreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: activeScreen,
      ),
    );
  }
}
