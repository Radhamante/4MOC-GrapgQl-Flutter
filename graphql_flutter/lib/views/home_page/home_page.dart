import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:graphql_flutter_5_moc/repositories/auth_repository.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:graphql_flutter_5_moc/views/home_page/cubit/home_cubit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.userData}) : super(key: key);
  final User userData;

  @override
  Widget build(BuildContext context) {
    print('userData $userData');
    return Provider(
      create: (context) => userData,
      child: RepositoryProvider(
        create: (context) => DataRepository(),
        child: BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(userData),
          child: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_outline,
                    ),
                  )
                ],
              ),
              body: context.watch<HomeCubit>().generateHomeContentByState(),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'Borrowed',
                    backgroundColor: Colors.blue,
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'History',
                    backgroundColor: Colors.blue,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.museum),
                    label: 'Library',
                    backgroundColor: Colors.blue,
                  )
                ],
                // backgroundColor: Colors.blue,
                currentIndex: state.selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: (int index) =>
                    context.read<HomeCubit>().setHomePage(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}
