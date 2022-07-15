part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginSubmit extends LoginEvent {
  final String username;
  final String password;
  LoginSubmit ({required this.username, required this.password});
}

