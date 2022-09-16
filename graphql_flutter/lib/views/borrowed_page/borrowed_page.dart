import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:graphql_flutter_5_moc/views/borrowed_page/cubit/borrowed_cubit.dart';
import 'package:provider/provider.dart';

class BorrowedPage extends StatelessWidget {
  const BorrowedPage({Key? key, required this.userData}) : super(key: key);
  final User userData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BorrowedCubit>(
      create: (context) => BorrowedCubit(
        context.read<DataRepository>(),
        userData.id,
      ),
      child: BlocConsumer<BorrowedCubit, BorrowedState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state is AuthSuccessState) {
          //   print("success auth! User ${state.userLogged}");
          // }
        },
        builder: (context, state) {
          if (state is BorrowedLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              child: Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return context
                          .read<BorrowedCubit>()
                          .generateBorrowedItemTile(index);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
