import 'package:flutter/material.dart';

class AnswerComparisonScreen extends StatelessWidget {
  final String userAnswer;
  final String correctAnswer;

  const AnswerComparisonScreen({
    super.key,
    required this.userAnswer,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Answer:',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            // Text(
            //   'Correct Answer: $correctAnswer',
            //   style: TextStyle(fontSize: 20, color: Colors.green),
            // ),
          ],
        ),
      ),
    );
  }
}
