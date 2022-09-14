import 'package:graphql_flutter/dtos/user_dto.dart';
import 'package:graphql_flutter/models/user.dart';

class AuthRepository {
  Future<User?> getUserFromCache() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return null;
  }

  Future<User?> signup(UserCreateDTO dto) async {
    print('createUSerDTO: $dto');
    await Future.delayed(const Duration(milliseconds: 1000));
    return User("toto", dto.email); //TODO
  }

  Future<User?> signin(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return User("toto", email); //TODO
  }
}
