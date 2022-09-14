import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/views/history_page/cubit/history_cubit.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryCubit>(
      create: (context) => HistoryCubit(),
      child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state is AuthSuccessState) {
          //   print("success auth! User ${state.userLogged}");
          // }
        },
        builder: (context, state) {
          return Container(
            child: const Text("History Page"),
          );
        },
      ),
    );
  }
}
