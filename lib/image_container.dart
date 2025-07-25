import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});
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
          onPressed: () {
            print('Button Pressed!');
          },
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
