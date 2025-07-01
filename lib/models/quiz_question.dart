class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // List<String> getShuffledAnswers() {
  //   final shuffledList = List.of(answers);
  //   shuffledList.shuffle();
  //   return shuffledList;
  // }
  // This method returns a shuffled version of the answers list, ensuring that the order of answers is randomized each time the question is presented.

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  //this method also works similarly but we can use getter syntax for better readability.
}
