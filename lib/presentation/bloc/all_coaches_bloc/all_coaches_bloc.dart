import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/all_coaches_bloc/all_coaches_event.dart';
import 'package:squadsyncweb/presentation/bloc/all_coaches_bloc/all_coaches_state.dart';

class AllCoachesBloc extends Bloc<AllCoachesEvent, AllCoachesState> {
  AllCoachesBloc() : super(AllCoachesUpdateState(value: 0)) {
    on<AllCoachesUpdateEvent>(allCoachesUpdateEvent);
  }

  FutureOr<void> allCoachesUpdateEvent(
      AllCoachesUpdateEvent event, Emitter<AllCoachesState> emit) {
    emit(AllCoachesUpdateState(value: event.value));
  }
}
