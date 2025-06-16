import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          icon: Icon(Icons.arrow_right_alt, color: Colors.white),
          label: Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
