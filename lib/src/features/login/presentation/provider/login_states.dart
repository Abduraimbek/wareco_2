import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  LoginLoadingState({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

class LoginErrorState extends LoginState {
  LoginErrorState({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}
