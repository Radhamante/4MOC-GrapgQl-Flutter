String mutationBorrow({required String idBook, required String idUser}) {
  return """
    mutation borrow{
  borrow(input:{book:"$idBook", user:"$idUser"}){
    book{
      id
      title
    }
    user{
      id
    name
    }
    history{
      id
      endDate
    }
  }
}
  """;
}
