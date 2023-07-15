class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;

  final List<String> answer;

  List<String> getShuffledAnswers() {
    final shuffledlist = List.of(answer);

    shuffledlist.shuffle();
    return shuffledlist;
  }
}
