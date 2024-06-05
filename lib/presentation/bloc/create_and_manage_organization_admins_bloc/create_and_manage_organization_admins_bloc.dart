import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_admins_bloc/create_and_manage_organization_admins_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_admins_bloc/create_and_manage_organization_admins_state.dart';

class CreateAndManageOrganizationAdminsBloc extends Bloc<
    CreateAndManageOrganizationAdminsEvent,
    CreateAndManageOrganizationAdminsState> {
  CreateAndManageOrganizationAdminsBloc()
      : super(CreateAndManageOrganizationAdminsUpdateState(value: 0)) {
    on<CreateAndManageOrganizationAdminsUpdateEvent>(
        createAndManageOrganizationAdminsUpdateEvent);
  }

  FutureOr<void> createAndManageOrganizationAdminsUpdateEvent(
      CreateAndManageOrganizationAdminsUpdateEvent event,
      Emitter<CreateAndManageOrganizationAdminsState> emit) {
    emit(CreateAndManageOrganizationAdminsUpdateState(value: event.value));
  }
}
