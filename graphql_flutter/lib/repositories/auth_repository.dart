import 'dart:convert';

import 'package:graphql_flutter_5_moc/dtos/user_dto.dart';
import 'package:graphql_flutter_5_moc/graphql/queries/login.dart';
import 'package:graphql_flutter_5_moc/graphql/queries/register.dart';
import 'package:graphql_flutter_5_moc/main.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<User?> getUserFromCache() async {
    try {
      // var res = await http.post(Uri.parse("http://localhost:4000/graphql"),
      //     body: {"query": mutationLogin()}, headers: {"authorization": token});
      // token = jsonDecode(res.body)["data"]["login"]["token"];
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> signup(UserCreateDTO dto) async {
    print('createUSerDTO: ${dto.gender}');
    var res = await http.post(Uri.parse("http://localhost:4000/graphql"),
        body: {"query": mutationRegister(dto)},
        headers: {"authorization": token});

    var data = jsonDecode(res.body)["data"]["register"];
    User user = User.fromJson(data["user"]);
    token = data["token"];
    return user;
  }

  Future<User?> signin(
      {required String email, required String password}) async {
    // print('createUSerDTO: $dto');
    // await Future.delayed(const Duration(milliseconds: 1000));
    var res = await http.post(Uri.parse("http://localhost:4000/graphql"),
        body: {"query": mutationLogin(email: email, password: password)},
        headers: {"authorization": token});

    var data = jsonDecode(res.body)["data"]["login"];
    User user = User.fromJson(data["user"]);
    token = data["token"];

    token = jsonDecode(res.body)["data"]["login"]["token"];

    return user;
  }
}
