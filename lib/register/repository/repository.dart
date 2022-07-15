import '../../models/usermodel.dart';

abstract class Repository {

  Future<bool> adduser(User user);


}
