class User {
  String id;
  String name;
  String email;
  bool isAdmin = true;
  User(this.id, this.name, this.email);
  // password: String!
  // books_borrowed: [Book]!
  // isAdmin: Boolean!
  // gender: userGender!
  // historys: [History!]

  @override
  String toString() {
    // TODO: implement toString
    return "User: { id: $id, name: $name, email: $email, isAdmin: $isAdmin }";
  }
}
