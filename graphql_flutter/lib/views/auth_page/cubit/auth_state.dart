part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final User userLogged;

  AuthSuccessState(this.userLogged);
}

class AuthSignupState extends AuthState {}

class AuthSignupLoadingState extends AuthState {}

class AuthSigninState extends AuthState {}

class AuthSigninLoadingState extends AuthState {}
