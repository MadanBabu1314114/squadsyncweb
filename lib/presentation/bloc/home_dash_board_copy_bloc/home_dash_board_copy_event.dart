abstract class HomeDashBoardCopyEvent {}

class HomeDashBoardCopyUpdateEvent extends HomeDashBoardCopyEvent {
  final int value;
  HomeDashBoardCopyUpdateEvent({required this.value});
}
