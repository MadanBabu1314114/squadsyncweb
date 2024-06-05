abstract class ViewSuperAdminState {
  int selectedRow;
  ViewSuperAdminState({required this.selectedRow});
}

class ViewSuperAdminUpdateState extends ViewSuperAdminState {
  final int value;
  ViewSuperAdminUpdateState({required this.value})
      : super(selectedRow: value);
}
