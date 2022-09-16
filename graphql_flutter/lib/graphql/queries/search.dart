String querySearch(String query) {
  return """
query search{
  search(query:"$query", filter:{start: 0, count:100}){
    ... on Book{
      id
      title
      isbn
      title
      author
      date
			imageUrl
      genre
    }
    ... on User{
      name,
      email,
      isAdmin
    }
    ... on Library{
      id
      name
      address{
        id
        name
      }
    }
    __typename
  }
}
""";
}
