abstract class CreateAndManageOrganizationState {
  int selectedRow;
  CreateAndManageOrganizationState({required this.selectedRow});
}

class CreateAndManageOrganizationUpdateState extends CreateAndManageOrganizationState {
  final int value;
  CreateAndManageOrganizationUpdateState({required this.value}) : super(selectedRow: value);
}
