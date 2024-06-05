import 'package:flutter/material.dart';

abstract class RegisterBussinessRepository {
  Future<String> getUserRegister(
      BuildContext context,
      String firstName,
      String lastName,
      String userName,
      String email,
      String passWord,
      String role);
}
