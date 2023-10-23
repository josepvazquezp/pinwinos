part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoadLoginState extends LoginState {}

final class GetUserSuccessState extends LoginState {}

final class ErrorState extends LoginState {}
