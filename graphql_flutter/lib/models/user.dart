class User {
  String id;
  String name;
  String email;
  bool isAdmin;
  User(this.id, this.name, this.email, this.isAdmin);
  // password: String!
  // books_borrowed: [Book]!
  // isAdmin: Boolean!
  // gender: userGender!
  // historys: [History!]

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? json['id'] : "",
        name = json['name'] != null ? json['name'] : "",
        email = json['email'] != null ? json['email'] : "",
        isAdmin = json['isAdmin'] != null ? json['isAdmin'] : "";

  @override
  String toString() {
    // TODO: implement toString
    return "User: { id: $id, name: $name, email: $email, isAdmin: $isAdmin }";
  }
}
