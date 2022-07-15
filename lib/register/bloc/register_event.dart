part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class AddUser extends RegisterEvent {
  final String username;
  final String password;
  AddUser ({required this.username, required this.password});
}

