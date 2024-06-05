abstract class AllStaffEvent {}

class AllStaffUpdateEvent extends AllStaffEvent {
  final int value;
  AllStaffUpdateEvent({required this.value});
}
