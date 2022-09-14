import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/models/user.dart';
import 'package:graphql_flutter/repositories/auth_repository.dart';
import 'package:graphql_flutter/views/home_page/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.userData}) : super(key: key);
  final User userData;

  @override
  Widget build(BuildContext context) {
    print('userData $userData');
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
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
                icon: Icon(Icons.home),
                label: 'Borrowed',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Search',
                  backgroundColor: Colors.blue),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'History',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Library',
                backgroundColor: Colors.blue,
              )
            ],
            // backgroundColor: Colors.blue,
            currentIndex: state.selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) => context.read<HomeCubit>().setHomePage(index),
          ),
        );
      }),
    );
  }
}
