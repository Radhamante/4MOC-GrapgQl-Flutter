import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:graphql_flutter_5_moc/views/detail_product_page/detail_product_page.dart';
import 'package:graphql_flutter_5_moc/views/search_page/cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(context.read<DataRepository>()),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state is AuthSuccessState) {
          //   print("success auth! User ${state.userLogged}");
          // }
        },
        builder: (context, state) {
          // if (state is SearchLoadingState) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          return Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              child: Column(
                children: [
                  TextField(
                    controller: context.read<SearchCubit>().searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) =>
                        context.read<SearchCubit>().onWriteSearch(value),
                  ),
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
                                          builder: (context) =>
                                              DetailProductPage(),
                                        ),
                                      );
                                    },
                                    child: context
                                        .read<SearchCubit>()
                                        .generateProductItemTile(index),
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
