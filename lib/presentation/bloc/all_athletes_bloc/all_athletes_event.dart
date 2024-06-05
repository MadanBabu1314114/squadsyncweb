abstract class AllAthletesEvent {}

class AllAthletesUpdateEvent
    extends AllAthletesEvent {
  final int value;
  AllAthletesUpdateEvent({required this.value});
}
