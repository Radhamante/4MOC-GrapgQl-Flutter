import 'package:graphql_flutter/dtos/user_dto.dart';
import 'package:graphql_flutter/models/user.dart';

class AuthRepository {
  String? cache;
  Future<User?> getUserFromCache() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      return User("1", "toto", "toto@toto.fr");
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> signup(UserCreateDTO dto) async {
    print('createUSerDTO: $dto');
    await Future.delayed(const Duration(milliseconds: 1000));
    return User("1", dto.name, dto.email); //TODO
  }

  Future<User?> signin(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return User("1", "dto.name", email); //TODO
  }
}
