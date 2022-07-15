import 'package:onlinetest/models/usermodel.dart';
import 'package:onlinetest/repository/repository.dart';

import '../services/dbhelper.dart';

class RepositoryImpl extends Repository {
  @override
  Future<List<User>> getUsers(String username, String password) {
    return Future.value(<User>[]);
  }

  @override
  Future<bool> login(User user) {

    DBHelper dbHelper = DBHelper();
    Future<bool> res;

    User userType = User(username: user.username, password: user.password);

    res = dbHelper.loginByUsernameAndPassword(userType);

    return res;
  }

}
