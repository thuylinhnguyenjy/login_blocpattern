import 'package:onlinetest/interactors/interactor.dart';
import 'package:onlinetest/models/usermodel.dart';

import '../repository/repository.dart';

class InteractorImpl extends Interactor {

  final Repository repository;

  InteractorImpl(this.repository);

  var _user = new User(username: '', password: '');

  @override
  User get user => _user;

  @override
  Future<bool> login(User user) async {

    final res = await repository.login(user);

    return res;
  }

}