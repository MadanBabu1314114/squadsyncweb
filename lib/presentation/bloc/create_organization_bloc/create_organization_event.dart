import 'package:flutter/material.dart';
import 'package:squadsyncweb/data/model/address.dart';
import 'package:squadsyncweb/data/model/organization.dart';

abstract class CreateOrganizationEvent {}

class CreateOrganizationSendRequestEvent extends CreateOrganizationEvent {
  final Address address;
  final Organization organization;
  final String bearerToken;
  final String sports;
  final BuildContext context;

  CreateOrganizationSendRequestEvent(
      {required this.address,
      required this.organization,
      required this.bearerToken,
      required this.sports,
      required this.context});
}
