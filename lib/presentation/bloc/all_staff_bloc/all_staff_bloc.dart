import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:squadsyncweb/presentation/bloc/all_staff_bloc/all_staff_event.dart';
import 'package:squadsyncweb/presentation/bloc/all_staff_bloc/all_staff_state.dart';

class AllStaffBloc extends Bloc<AllStaffEvent, AllStaffState> {
  AllStaffBloc() : super(AllStaffUpdateState(value: 0)) {
    on<AllStaffUpdateEvent>(allStaffUpdateEvent);
  }

  FutureOr<void> allStaffUpdateEvent(
      AllStaffUpdateEvent event, Emitter<AllStaffState> emit) {
    emit(AllStaffUpdateState(value: event.value));
  }
}
