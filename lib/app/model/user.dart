class User {
  String name;
  String email;

  User({this.name, this.email});

  static User fromMap(Map map) {
    final String name = map["name"];
    final String email = map["email"];

    return User(name: name, email: email);
  }
}
