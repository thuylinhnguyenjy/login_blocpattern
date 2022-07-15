import '../models/usermodel.dart';

abstract class Repository {

  Future<bool> login(User user);

  Future<List<User>> getUsers(String username, String password);
}
