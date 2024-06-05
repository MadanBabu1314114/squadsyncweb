import 'package:flutter/material.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  final BuildContext context;
  final bool isOrg;

  LoginButtonPressed(this.context, {required this.username, required this.password , required this.isOrg});
}
