import 'dart:async';
import 'package:shoppingcart/api/api_login.dart';
import 'package:shoppingcart/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:shoppingcart/models/login_model.dart';
import 'package:shoppingcart/dao/user_dao.dart';

class UserRepository {
  final userDao = UserDao();

  Future<User> authenticate ({
    @required String username,
    @required String password,
  }) async {
    LoginModel userLogin = LoginModel(
        username: username,
        password: password
    );
    Token token = await getToken(userLogin);
    User user = User(
      id: 0,
      username: username,
      token: token.token,
    );
    return user;
  }

  Future<void> persistToken ({
    @required User user
  }) async {
    // write token with the user to the database
    await userDao.createUser(user);
  }

  Future <void> deleteToken({
    @required int id
  }) async {
    await userDao.deleteUser(id);
  }

  Future <bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }
}
