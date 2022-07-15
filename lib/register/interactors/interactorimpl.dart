import 'package:onlinetest/models/usermodel.dart';

import '../../register/repository/repository.dart';
import 'interactor.dart';

class InteractorImpl extends Interactor {

  final Repository repository;

  InteractorImpl(this.repository);

  var _user = new User(username: '', password: '');

  @override
  User get user => _user;

  @override
  Future<bool> adduser(User user) async {

    final res = await repository.adduser(user);

    return res;

  }

}