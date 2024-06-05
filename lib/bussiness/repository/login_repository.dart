import 'package:flutter/material.dart';
import 'package:squadsyncweb/bussiness/entity/user.dart';
import 'package:squadsyncweb/data/data_source/login_data_source.dart';

class LoginRepository {
  final LoginDataSource dataSource;

  LoginRepository({required this.dataSource});

  Future<UserToken> loginUser(
      String username, String password, BuildContext context) async {
    final response = await dataSource.loginUser(username, password, context);

    return UserToken(
      accessToken: response.access_token,
    );
  }
}
