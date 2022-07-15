import 'package:onlinetest/register/repository/repository.dart';
import 'package:onlinetest/models/usermodel.dart';
import '../../services/dbhelper.dart';

class RepositoryImpl extends Repository {
  @override
  Future<bool> adduser(User user) {
    DBHelper dbHelper = DBHelper();
    Future<bool> res;

    User userModel = User(username: user.username, password: user.password);

    res = dbHelper.createNewUser(userModel);

    return res;
  }

}
