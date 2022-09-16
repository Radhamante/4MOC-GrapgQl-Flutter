import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter_5_moc/components/app_text_form_field.dart';
import 'package:graphql_flutter_5_moc/dtos/user_dto.dart';
import 'package:graphql_flutter_5_moc/enums/user_gender.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:graphql_flutter_5_moc/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.authRepository, // {required this.authRepository}
  ) : super(AuthInitialLoadingState()) {
    checkUserIsLogged();
  }
  final AuthRepository authRepository;

  final formKeyAuth = GlobalKey<FormState>();
  final emailController = TextEditingController();
  //gender
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  UserGender genderSelected = UserGender.UNKNOWN;

  void onChangedDropDownListUserGender(UserGender? value) {
    if (value == null) return;
    genderSelected = value;
  }

  void checkUserIsLogged() async {
    User? user = await authRepository.getUserFromCache();
    if (user == null) {
      return emit(AuthSigninState());
    }
    emit(AuthSuccessState(user));
  }

  void onClickSubmitButton() async {
    if (formKeyAuth.currentState!.validate()) {
      if (state is AuthSignupState) {
        emit(AuthSignupLoadingState());
        String name = nameController.text.trim();
        String email = emailController.text.trim();
        String password = passwordController.text.trim();
        UserCreateDTO dto =
            UserCreateDTO(name, email, password, UserGender.MALE);
        User? user = await authRepository.signup(dto);
        if (user == null) {
          //emit(error?) //TODO
          return;
        }
        emit(AuthSuccessState(user));
      }
      emit(AuthSigninLoadingState());
      User? user = await authRepository.signin(
          email: nameController.text.trim(),
          password: passwordController.text.trim());
      if (user == null) {
        //emit(error?) //TODO
        return;
      }
      emit(AuthSuccessState(user));
    }
  }

  Widget displayConfirmPasswordField() {
    return AppConfirmPasswordTextFormField(
      controller: _passwordConfirmController,
      input: "Confirm password",
      passwordController: passwordController,
    );
  }

  Widget displayLinkText() {
    String text =
        state is AuthSignupState ? "Signin an account" : "Create a new account";
    return GestureDetector(
      child: Text(
        text,
        style: const TextStyle(
            decoration: TextDecoration.underline, color: Colors.blue),
      ),
      onTap: () => {
        if (state is AuthSignupState)
          emit(AuthSigninState())
        else if (state is AuthSigninState)
          emit(AuthSignupState())
      },
    );
  }
}
