import 'dart:typed_data';

import 'package:flutter/material.dart';

abstract class AddUsersEvent {}

class AddUsersInitialEvent extends AddUsersEvent {}

class AddUsersUploadTheFileEvent extends AddUsersEvent {
  final Uint8List file;
  final BuildContext context;
  AddUsersUploadTheFileEvent({required this.file, required this.context});
}

class AddUsersStartTheRegisterationEvent extends AddUsersEvent {
  final BuildContext context;
  final bool isAthlete;

  AddUsersStartTheRegisterationEvent(
      {required this.context, required this.isAthlete});
}

class AddUsersCancelEvent extends AddUsersEvent {}
