import 'package:onlinetest/models/usermodel.dart';

abstract class Interactor {
  User? user;

  Future<bool> adduser(User user);

}