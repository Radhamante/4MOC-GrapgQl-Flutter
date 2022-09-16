import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:graphql_flutter_5_moc/repositories/auth_repository.dart';
import 'package:graphql_flutter_5_moc/views/auth_page/auth_page.dart';
import 'package:graphql_flutter_5_moc/views/detail_product_page/detail_product_page.dart';
import 'package:provider/provider.dart';

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMjM3MDdiMmI3NDczZDI2NmZjZjFkZCIsImVtYWlsIjoibHVkb0BsZW1laWxsZXVyLmZyIiwiaWF0IjoxNjYzMjY2OTM5LCJleHAiOjE2OTQ4MjQ1Mzl9.yEe981Ve1HBmTPgcJYDwbxgWRSyfbPCJKi94hWou3oc"; //.state;

User? user;

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final Link link = HttpLink('http://localhost:4000/graphql', defaultHeaders: {
    if (token.isNotEmpty) 'authorization': token,
  });

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: const AuthPage(),
      ),
    );
  }
}
