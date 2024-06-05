import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/view_organization_admin_bloc/view_organization_admin_event.dart';
import 'package:squadsyncweb/presentation/bloc/view_organization_admin_bloc/view_organization_admin_state.dart';

class ViewOrganizationAdminBloc
    extends Bloc<ViewOrganizationAdminEvent, ViewOrganizationAdminState> {
  ViewOrganizationAdminBloc()
      : super(ViewOrganizationAdminUpdateState(value: 0)) {
    on<ViewOrganizationAdminUpdateEvent>(viewOrganizationAdminUpdateEvent);
  }

  FutureOr<void> viewOrganizationAdminUpdateEvent(
      ViewOrganizationAdminUpdateEvent event,
      Emitter<ViewOrganizationAdminState> emit) {
    emit(ViewOrganizationAdminUpdateState(value: event.value));
  }
}
