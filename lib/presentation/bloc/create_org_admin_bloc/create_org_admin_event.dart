import 'package:flutter/material.dart';
import 'package:squadsyncweb/data/model/address.dart';
import 'package:squadsyncweb/data/model/education.dart';
import 'package:squadsyncweb/data/model/person.dart';

abstract class CreateOrgAdminEvent {}

class CreateOrgAdminSendRequestEvent extends CreateOrgAdminEvent {
  final String bearerToken;
  final Address address;
  final Education education;
  final String personRole;
  final Person person;
  final BuildContext context;

  CreateOrgAdminSendRequestEvent(
      {required this.bearerToken,
      required this.address,
      required this.education,
      required this.personRole,
      required this.person,
      required this.context});
}

class CreateOrgAdminRetrieveListOrgEvent extends CreateOrgAdminEvent {}
