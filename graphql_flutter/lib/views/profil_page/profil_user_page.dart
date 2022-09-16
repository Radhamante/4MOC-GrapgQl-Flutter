import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter_5_moc/views/detail_product_page/cubit/detail_product_cubit.dart';

class UserProfilPage extends StatelessWidget {
  UserProfilPage({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  var genderController = TextEditingController();

  void testButtonEmprunter() {
    print("OK");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailProductCubit>(
        create: (context) => DetailProductCubit(),
        child: BlocConsumer<DetailProductCubit, DetailProductState>(
            listener: (context, state) {
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
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side:
                          const BorderSide(color: Colors.lightBlue, width: 1.5),
                    ),
                    title: Row(
                      children: [
                        const Text('Name :  '),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: nameController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side:
                          const BorderSide(color: Colors.lightBlue, width: 1.5),
                    ),
                    title: Row(
                      children: [
                        const Text('Mail :  '),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: mailController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side:
                          const BorderSide(color: Colors.lightBlue, width: 1.5),
                    ),
                    title: Row(
                      children: [
                        const Text('PassWord :  '),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side:
                          const BorderSide(color: Colors.lightBlue, width: 1.5),
                    ),
                    title: Row(
                      children: [
                        const Text('Gender :  '),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            controller: genderController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: Text(
                      "OK",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
