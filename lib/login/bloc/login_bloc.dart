import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usermodel.dart';
import '../interactors/interactorimpl.dart';
import '../repository/repositoryimpl.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final _interactor = InteractorImpl(
    RepositoryImpl(),
  );

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmit>(_onLoginSubmit);
  }

  FutureOr<void> _onLoginSubmit(
      LoginSubmit event, Emitter<LoginState> emit) async {

    User user = User(username: event.username, password: event.password);

    await _interactor.login(user).then((dynamic result) {
      if (result == true)
        emit(LoginSuccess(user));
      else
        emit(LoginFailed(user));
    });
    emit(LoginInitial());
  }

}
