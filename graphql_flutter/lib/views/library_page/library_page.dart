import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:graphql_flutter_5_moc/views/library_page/cubit/library_cubit.dart';
import 'package:graphql_flutter_5_moc/views/search_page/cubit/search_cubit.dart';

import '../../models/library.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LibraryCubit>(
      create: (context) => LibraryCubit(context.read<DataRepository>()),
      child: BlocConsumer<LibraryCubit, LibraryState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state is AuthSuccessState) {
          //   print("success auth! User ${state.userLogged}");
          // }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  state is SearchLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: Center(
                            child: ListView.builder(
                              itemCount: state.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                  background: Container(color: Colors.grey),
                                  key: UniqueKey(),
                                  onDismissed: (direction) {},
                                  child: InkWell(
                                    splashColor: Colors.lightBlue,
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LibraryPage(),
                                        ),
                                      );
                                    },
                                    child: context
                                        .read<LibraryCubit>()
                                        .generateLibraryTile(index),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
