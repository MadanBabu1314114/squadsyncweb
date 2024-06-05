abstract class AllAthletesState {
  int selectedRow;
  AllAthletesState({required this.selectedRow});
}

class AllAthletesUpdateState
    extends AllAthletesState {
  final int value;
  AllAthletesUpdateState({required this.value})
      : super(selectedRow: value);
}
