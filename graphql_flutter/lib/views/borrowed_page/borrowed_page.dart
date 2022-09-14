import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/views/borrowed_page/cubit/borrowed_cubit.dart';

class BorrowedPage extends StatelessWidget {
  const BorrowedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BorrowedCubit>(
      create: (context) => BorrowedCubit(),
      child: BlocConsumer<BorrowedCubit, BorrowedState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state is AuthSuccessState) {
          //   print("success auth! User ${state.userLogged}");
          // }
        },
        builder: (context, state) {
          return Container(
            child: const Text("Borrowed Page"),
          );
        },
      ),
    );
  }
}
