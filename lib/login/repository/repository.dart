import '../../models/usermodel.dart';

abstract class Repository {

  Future<bool> login(User user);

}
