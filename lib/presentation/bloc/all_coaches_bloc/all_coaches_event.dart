abstract class AllCoachesEvent {}

class AllCoachesUpdateEvent extends AllCoachesEvent {
  final int value;
  AllCoachesUpdateEvent({required this.value});
}
