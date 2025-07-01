import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  var activeScreen = 'question-screen';

  void answerQuestion(String answeredText) {
    setState(() {
      widget.onSelectAnswer(
        answeredText,
      ); // Call the callback with the selected answer
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      // Optionally, return an empty Container or loading indicator
      return Container();
    }
    var currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                // Each answer is wrapped in a Container to provide margin
                child: AnswerButton(
                  answerText: answer,
                  onTap: () => answerQuestion(answer),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
