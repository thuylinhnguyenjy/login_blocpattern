part of 'register_bloc.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final User user;
  const RegisterSuccess(this.user);
}

class RegisterFailed extends RegisterState {
  final User user;
  const RegisterFailed(this.user);
}



