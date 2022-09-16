import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter_5_moc/models/book.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:graphql_flutter_5_moc/views/bowrrable_history_page/borrowable_history_page.dart';
import 'package:graphql_flutter_5_moc/views/detail_product_page/cubit/detail_product_cubit.dart';
import 'package:graphql_flutter_5_moc/views/detail_product_page/cubit/detail_product_cubit.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key, required this.book}) : super(key: key);

  final Book book;
  void testButtonEmprunter() {
    print("OK");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailProductCubit>(
        create: (context) => DetailProductCubit(DataRepository(), book),
        child: BlocConsumer<DetailProductCubit, DetailProductState>(
            listener: (context, state) {
          if (state is DetailProductBorrowLoadedState) {
            var snackBar = SnackBar(
              content: Text("Borrow product success"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          // TODO: implement listener
          // if (state is AuthSuccessState) {
          //   print("success auth! User ${state.userLogged}");
          // }
        }, builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("E Library"),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<DetailProductCubit>().borrow();
                  },
                  icon: const Icon(
                    Icons.person_outline,
                  ),
                )
              ],
            ),
            body: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.network(
                        'https://fr.shopping.rakuten.com/photo/894175820_L.jpg',
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 130, bottom: 10),
                      child: Text("Type : "),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 130, bottom: 10),
                      child: Text("Auteur"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 130, bottom: 10),
                      child: Text("Année : "),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 130, bottom: 10),
                      child: Text("Bibliothèque : "),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 130, bottom: 10),
                      child: Text("Genre : "),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 130, bottom: 10),
                      child: Text("Disponible : "),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150, right: 150, top: 20),
                      child: ElevatedButton(
                          child: Text('Emprunter'),
                          onPressed: state is DetailProductBorrowLoadedState
                              ? null
                              : () {
                                  context.read<DetailProductCubit>().borrow();
                                },
                          style: ElevatedButton.styleFrom()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150, right: 150, top: 20),
                      child: ElevatedButton(
                          child: Text('Historique'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BorrowableHistoryPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom()),
                    )
                  ]),
            ),
          );
        }));
  }
}
