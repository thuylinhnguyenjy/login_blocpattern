import 'package:onlinetest/login/repository/repository.dart';
import 'package:onlinetest/models/usermodel.dart';
import '../../services/dbhelper.dart';

class RepositoryImpl extends Repository {

  @override
  Future<bool> login(User user) {

    DBHelper dbHelper = DBHelper();
    Future<bool> res;

    User userModel = User(username: user.username, password: user.password);

    res = dbHelper.loginByUsernameAndPassword(userModel);

    return res;
  }

}
