import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/repositories/auth_repository.dart';
import 'package:graphql_flutter/views/auth_page/auth_page.dart';
import 'package:graphql_flutter/views/detail_product_page/detail_product_page.dart';
import 'package:graphql_flutter/views/history_page/borrowable_history_page.dart';
import 'package:provider/provider.dart';

void main() {
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
        child: AuthPage(),
      ),
    );
  }
}
