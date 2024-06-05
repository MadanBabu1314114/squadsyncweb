import 'package:flutter/material.dart';
import 'package:squadsyncweb/bussiness/repository/register_business_repository.dart';

class RegisterUsecase {
  final RegisterBussinessRepository registerBussinessRepository;
  RegisterUsecase({required this.registerBussinessRepository});

  Future<String> register(
      BuildContext context,
      String firstName,
      String lastName,
      String userName,
      String email,
      String passWord,
      String role) async {
    return await registerBussinessRepository.getUserRegister(
        context, firstName, lastName, userName, email, passWord, role);
  }
}
