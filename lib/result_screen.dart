import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List userAnswer;

  const ResultScreen({super.key, required this.userAnswer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Answer:',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
