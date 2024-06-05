import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/home_dash_board_copy_bloc/home_dash_board_copy_event.dart';
import 'package:squadsyncweb/presentation/bloc/home_dash_board_copy_bloc/home_dash_board_copy_state.dart';

class HomeDashBoardCopyBloc
    extends Bloc<HomeDashBoardCopyEvent, HomeDashBoardCopyState> {
  HomeDashBoardCopyBloc() : super(HomeDashBoardCopyUpdateState(value: 4)) {
    on<HomeDashBoardCopyUpdateEvent>(homeDashBoardCopyUpdateEvent);
  }

  FutureOr<void> homeDashBoardCopyUpdateEvent(
      HomeDashBoardCopyUpdateEvent event,
      Emitter<HomeDashBoardCopyState> emit) {
    emit(HomeDashBoardCopyUpdateState(value: event.value));
  }
}
