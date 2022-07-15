import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onlinetest/interactors/interactorimpl.dart';

import '../../models/usermodel.dart';
import '../../repository/repositoryimpl.dart';
import '../../services/dbhelper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final _interactor = InteractorImpl(
    RepositoryImpl(),
  );

 // static User user = User(username: '', password: '');

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmit>(_onLoginSubmit);
    //on<LoginUsernameChanged>(_onLoginUsernameChanged);
  }

  FutureOr<void> _onLoginSubmit(
      LoginSubmit event, Emitter<LoginState> emit) async {

    // DBHelper dbHelper = DBHelper();
    // Future<bool> res;
    //
    User user = User(username: event.username, password: event.password);
    // res = dbHelper.loginByUsernameAndPassword(user);

    await _interactor.login(user).then((dynamic result) {
      if (result == true)
        emit(LoginSuccess(user));
      else
        emit(LoginFailed(user));
    });
    emit(LoginInitial());
  }

  // FutureOr<void> _onLoginUsernameChanged(
  //     LoginUsernameChanged event, Emitter<LoginState> emit) {
  //     if (event.username.toString()))
  // }

//   bool validUsername(String username) {
//     return username.isNotEmpty && username.length >= 6;
// }
//
//   bool validPassword(String password) {
//     return password.isNotEmpty && password.length >= 6;
//   }

}
