import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/view_super_admin_bloc/view_super_admin_event.dart';
import 'package:squadsyncweb/presentation/bloc/view_super_admin_bloc/view_super_admin_state.dart';

class ViewSuperAdminBloc
    extends Bloc<ViewSuperAdminEvent, ViewSuperAdminState> {
  ViewSuperAdminBloc() : super(ViewSuperAdminUpdateState(value: 0)) {
    on<ViewSuperAdminUpdateEvent>(viewSuperAdminUpdateEvent);
  }

  FutureOr<void> viewSuperAdminUpdateEvent(
      ViewSuperAdminUpdateEvent event, Emitter<ViewSuperAdminState> emit) {
    emit(ViewSuperAdminUpdateState(value: event.value));
  }
}
