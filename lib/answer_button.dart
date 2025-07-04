import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // this code is used to pass data from child to parent widget
      // onPressed: () {
      //   onTap(
      //     answerText,
      //   ); // Call the callback function with the answer text when pressed
      onPressed:
          onTap, // Call the callback function with the answer text when pressed

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: const Color.fromARGB(150, 255, 255, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}
// This widget represents a button for answering quiz questions.
// It takes the answer text and a callback function to be executed when the button is pressed.