String mutationLogin({required String email, required String password}) {
  return """
    mutation jadore_le_poulet{
  login(input:{email:"$email", password: "$password"}){
    token
    user{
      id
      name
      email
      isAdmin
    }
  }
}
  """;
}
