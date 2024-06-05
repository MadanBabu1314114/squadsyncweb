abstract class AllStaffState {
  int selectedRow;
  AllStaffState({required this.selectedRow});
}

class AllStaffUpdateState extends AllStaffState {
  final int value;
  AllStaffUpdateState({required this.value}) : super(selectedRow: value);
}
