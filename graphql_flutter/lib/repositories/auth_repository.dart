import 'dart:convert';

import 'package:graphql_flutter_5_moc/dtos/user_dto.dart';
import 'package:graphql_flutter_5_moc/graphql/queries/login.dart';
import 'package:graphql_flutter_5_moc/main.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<User?> getUserFromCache() async {
    try {
      var res = await http.post(Uri.parse("http://localhost:4000/graphql"),
          body: {"query": mutationLogin}, headers: {"authorization": token});
      token = jsonDecode(res.body)["data"]["login"]["token"];
      return User("1", "dto.name", "email", false);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> signup(UserCreateDTO dto) async {
    print('createUSerDTO: $dto');
    var res = await http.post(Uri.parse("http://localhost:4000/graphql"),
        body: {"query": mutationLogin}, headers: {"authorization": token});
    token = jsonDecode(res.body)["data"]["login"]["token"];
    return User("1", dto.name, dto.email, true); //TODO
  }

  Future<User?> signin(
      {required String email, required String password}) async {
    // print('createUSerDTO: $dto');
    // await Future.delayed(const Duration(milliseconds: 1000));
    var res = await http.post(Uri.parse("http://localhost:4000/graphql"),
        body: {"query": mutationLogin}, headers: {"authorization": token});
    token = jsonDecode(res.body)["data"]["login"]["token"];

    return User("1", "dto.name", email, false); //TODO
  }
}
