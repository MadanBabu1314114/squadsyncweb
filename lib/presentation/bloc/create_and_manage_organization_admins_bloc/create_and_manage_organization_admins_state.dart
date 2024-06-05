abstract class CreateAndManageOrganizationAdminsState {
  int selectedRow;
  CreateAndManageOrganizationAdminsState({required this.selectedRow});
}

class CreateAndManageOrganizationAdminsUpdateState
    extends CreateAndManageOrganizationAdminsState {
  final int value;
  CreateAndManageOrganizationAdminsUpdateState({required this.value})
      : super(selectedRow: value);
}
