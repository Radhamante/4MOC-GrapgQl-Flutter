import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/components/app_text_form_field.dart';
import 'package:graphql_flutter/enums/user_gender.dart';
import 'package:graphql_flutter/repositories/auth_repository.dart';
import 'package:graphql_flutter/views/auth_page/cubit/auth_cubit.dart';
import 'package:graphql_flutter/views/home_page/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(context.read<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Auth Page"),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is AuthSuccessState) {
              print("success auth! User ${state.userLogged}");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthInitialLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                children: [
                  Form(
                    key: context.watch<AuthCubit>().formKeyAuth,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: FractionallySizedBox(
                      widthFactor: 0.75,
                      child: Column(
                        children: [
                          if (state is AuthSignupState)
                            AppEmailTextFormField(
                              controller:
                                  context.watch<AuthCubit>().emailController,
                            ),
                          const SizedBox(height: 10),
                          AppTextFormField(
                            controller:
                                context.watch<AuthCubit>().nameController,
                            input: "Name",
                            isPassword: false,
                          ),
                          const SizedBox(height: 10),
                          if (state is AuthSignupState)
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                hintText: "Gender",
                              ),
                              items: UserGender.values
                                  .map((UserGender userGender) {
                                return DropdownMenuItem<UserGender>(
                                  value: userGender,
                                  child: Text(userGender.value),
                                );
                              }).toList(),
                              onChanged: context
                                  .watch<AuthCubit>()
                                  .onChangedDropDownListUserGender,
                            ),
                          const SizedBox(height: 10),
                          AppTextFormField(
                            controller:
                                context.watch<AuthCubit>().passwordController,
                            input: "Password",
                            isPassword: true,
                          ),
                          const SizedBox(height: 10),
                          if (state is AuthSignupState)
                            context
                                .watch<AuthCubit>()
                                .displayConfirmPasswordField(),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: state is AuthSignupLoadingState ||
                                    state is AuthSigninLoadingState
                                ? null
                                : () {
                                    try {
                                      context
                                          .read<AuthCubit>()
                                          .onClickSubmitButton();
                                    } catch (e) {
                                      var snackBar = SnackBar(
                                        content: Text(e.toString()),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      print(e);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16.0)),
                            icon: state is AuthSignupLoadingState ||
                                    state is AuthSigninLoadingState
                                ? Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2.0),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : const Icon(Icons.send),
                            label: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  context.watch<AuthCubit>().displayLinkText(),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
