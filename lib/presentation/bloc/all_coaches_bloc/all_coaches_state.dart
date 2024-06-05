abstract class AllCoachesState {
  int selectedRow;
  AllCoachesState({required this.selectedRow});
}

class AllCoachesUpdateState extends AllCoachesState {
  final int value;
  AllCoachesUpdateState({required this.value}) : super(selectedRow: value);
}
