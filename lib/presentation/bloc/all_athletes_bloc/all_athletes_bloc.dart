import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/all_athletes_bloc/all_athletes_event.dart';
import 'package:squadsyncweb/presentation/bloc/all_athletes_bloc/all_athletes_state.dart';

class AllAthletesBloc extends Bloc<AllAthletesEvent, AllAthletesState> {
  AllAthletesBloc() : super(AllAthletesUpdateState(value: 0)) {
    on<AllAthletesUpdateEvent>(allAthletesUpdateEvent);
  }

  FutureOr<void> allAthletesUpdateEvent(
      AllAthletesUpdateEvent event, Emitter<AllAthletesState> emit) {
    emit(AllAthletesUpdateState(value: event.value));
  }
}
