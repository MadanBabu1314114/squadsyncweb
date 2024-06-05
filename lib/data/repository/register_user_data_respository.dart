import 'package:flutter/material.dart';
import 'package:squadsyncweb/bussiness/repository/register_business_repository.dart';
import 'package:squadsyncweb/data/data_source/register_user_key_cloak_data_source.dart';

class RegisterUserDataRepository implements RegisterBussinessRepository {
  final RegisterUserKeyCloakDataSource registerUserKeyCloakDataSource;
  RegisterUserDataRepository({required this.registerUserKeyCloakDataSource});

  @override
  Future<String> getUserRegister(
      BuildContext context,
      String firstName,
      String lastName,
      String userName,
      String email,
      String passWord,
      String role) async {
    return await registerUserKeyCloakDataSource.registerUpUser(
        context, firstName, lastName, userName, email, passWord, role);
  }
}
