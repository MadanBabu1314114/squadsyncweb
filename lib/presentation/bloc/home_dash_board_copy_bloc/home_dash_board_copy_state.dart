abstract class HomeDashBoardCopyState {
  int currentScreen;
  HomeDashBoardCopyState({required this.currentScreen});
}

class HomeDashBoardCopyUpdateState extends HomeDashBoardCopyState {
  final int value;
  HomeDashBoardCopyUpdateState({required this.value})
      : super(currentScreen: value);
}
