class TypeQuestions {
  String question;
  bool isSevere;

  TypeQuestions({this.question, this.isSevere});

  static TypeQuestions fromMap(Map map) {
      final question = map["question"];
      final isSevere = map["isSevere"];

      return TypeQuestions(question: question, isSevere: isSevere);
  }
}