String mutationLogin = """
mutation jadore_le_poulet{
  login(input:{email:"ludo@lemeilleur.fr", password:"1234"}){
    token
  }
}
""";
