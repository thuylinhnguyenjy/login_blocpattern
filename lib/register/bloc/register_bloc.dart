import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usermodel.dart';
import '../interactors/interactorimpl.dart';
import '../repository/repositoryimpl.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late final _interactor = InteractorImpl(
    RepositoryImpl(),
  );

  RegisterBloc() : super(RegisterInitial()) {
    on<AddUser>(_onAddUser);
  }

  FutureOr<void> _onAddUser(
      AddUser event, Emitter<RegisterState> emit) async {

    User user = User(username: event.username, password: event.password);

    await _interactor.adduser(user).then((dynamic result) {
      if (result == true)
        emit(RegisterSuccess(user));
      else
        emit(RegisterFailed(user));
    });
    emit(RegisterInitial());
  }

}
