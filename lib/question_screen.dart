import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/answer_comparision_screen.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  var activeScreen = 'question-screen';
  List<String> clickedAnswer = []; // Store clicked answers if needed

  void answerQuestion(String answeredText) {
    setState(() {
      clickedAnswer.add(answeredText); // Add the clicked answer to the list
      currentQuestionIndex++;

      if (currentQuestionIndex >= questions.length) {
        // All questions answered, navigate to comparison screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnswerComparisonScreen(
              userAnswer: clickedAnswer.last, // Example: last answer
              correctAnswer:
                  questions.last.answers[0], // Example: correct answer
            ),
          ),
        );
      }
      // If all questions are answered, switch to the answer screen
      print(clickedAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      // Optionally, return an empty Container or loading indicator
      return Container();
    }
    var currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              // Each answer is wrapped in a Container to provide margin
              child: AnswerButton(answerText: answer, onTap: answerQuestion),
            );
          }),
        ],
      ),
    );
  }
}
