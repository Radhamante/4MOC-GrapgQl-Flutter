// import 'package:flutter/material.dart';
// import 'package:graphql_flutter_5_moc/graphql_flutter_5_moc.dart';
// import 'package:riverpod/riverpod.dart';

// final StateProvider<String> authTokenProvider =
//     StateProvider<String>((_) => '', name: 'tokenP');

// final graphQLClientProvider = Provider<GraphQLClient>((ref) {
//   final String token = ref.watch(authTokenProvider); //.state;

//   final Link link = HttpLink('http://localhost:4000/graphql', defaultHeaders: {
//     if (token.isNotEmpty) 'authorization': token,
//   });

//   return (GraphQLClient(
//     link: link,
//     cache: GraphQLCache(store: HiveStore()),
//   ));
// });
