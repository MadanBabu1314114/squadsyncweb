import 'package:flutter/material.dart';
import 'package:squadsyncweb/bussiness/entity/user.dart';
import 'package:squadsyncweb/bussiness/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  Future<UserToken> loginUser(
      String username, String password, BuildContext context) async {
    return await repository.loginUser(username, password, context);
  }
}
