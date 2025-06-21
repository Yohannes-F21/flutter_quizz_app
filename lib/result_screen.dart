import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_summary.dart';

class ResultScreen extends StatelessWidget {
  final List chosenAnswers;
  final void Function() onRestart;

  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your answered $correctAnswers of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ResultSummary(summaryData: summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: Icon(Icons.refresh_rounded, color: Colors.white),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
