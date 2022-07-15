import 'package:onlinetest/models/usermodel.dart';

abstract class Interactor {
  User? user;

  Future<bool> login(User user);

}