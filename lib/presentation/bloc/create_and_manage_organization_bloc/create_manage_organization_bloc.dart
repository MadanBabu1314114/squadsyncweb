import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_bloc/create_and_manage_organization_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_bloc/create_and_manage_organization_state.dart';

class CreateAndManageOrganizationBloc extends Bloc<
    CreateAndManageOrganizationEvent, CreateAndManageOrganizationState> {
  CreateAndManageOrganizationBloc()
      : super(CreateAndManageOrganizationUpdateState(value: 0)) {
    on<CreateAndManageOrganizationUpdateEvent>(
        createAndManageOrganizationUpdateEvent);
  }

  FutureOr<void> createAndManageOrganizationUpdateEvent(
      CreateAndManageOrganizationUpdateEvent event,
      Emitter<CreateAndManageOrganizationState> emit) {
    emit(CreateAndManageOrganizationUpdateState(value: event.value));
  }
}
