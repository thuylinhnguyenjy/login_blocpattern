part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}
//
// class LoginCheck extends LoginState {
//   final String username;
// }

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  const LoginSuccess(this.user);
}

class LoginFailed extends LoginState {
  final User user;
  const LoginFailed(this.user);
}

