import 'package:graphql_flutter_5_moc/dtos/user_dto.dart';

String mutationRegister(UserCreateDTO dto) {
  return """
mutation register{
  register(input: {name: "${dto.name}", email: "${dto.email}", password: "${dto.password}", gender:${dto.gender.name}}){
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
