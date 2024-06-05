abstract class ViewOrganizationAdminState {
  int selectedRow;
  ViewOrganizationAdminState({required this.selectedRow});
}

class ViewOrganizationAdminUpdateState extends ViewOrganizationAdminState {
  final int value;
  ViewOrganizationAdminUpdateState({required this.value}) : super(selectedRow: value);
}
