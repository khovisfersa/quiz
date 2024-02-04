import 'package:flutter/material.dart';

class StartQuizz extends StatelessWidget {
  const StartQuizz(this.startQuiz, {super.key});

  final void Function() startQuiz;

  void onPressed() {
    print("Deu certo");
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: Color.fromARGB(149, 246, 240, 248),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Bem vindo ao QuizzApp",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text("Iniciar"),
          ),
        ],
      ),
    );
  }
}
