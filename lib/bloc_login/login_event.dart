part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends LoginEvent {
  final String mail;
  final String password;

  GetUserEvent({required this.mail, required this.password});

  @override
  List<Object> get props => [this.mail, this.password];
}

class CreateUserEvent extends LoginEvent {
  final String name;
  final String mail;
  final String password;

  CreateUserEvent(
      {required this.name, required this.mail, required this.password});

  @override
  List<Object> get props => [this.name, this.mail, this.password];
}

class LogoutEvent extends LoginEvent {}
