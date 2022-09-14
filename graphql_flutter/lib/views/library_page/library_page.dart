import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/views/library_page/cubit/library_cubit.dart';
import 'package:graphql_flutter/views/search_page/cubit/search_cubit.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LibraryCubit>(
      create: (context) => LibraryCubit(),
      child: BlocConsumer<LibraryCubit, LibraryState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state is AuthSuccessState) {
          //   print("success auth! User ${state.userLogged}");
          // }
        },
        builder: (context, state) {
          return Container(
            child: const Text("Library Page"),
          );
        },
      ),
    );
  }
}
