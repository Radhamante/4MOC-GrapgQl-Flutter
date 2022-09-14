import 'package:graphql_flutter/enums/user_gender.dart';

class UserCreateDTO {
  String name;
  String email;
  String password;
  UserGender gender;
  UserCreateDTO(
    this.name,
    this.email,
    this.password,
    this.gender,
  );
}
