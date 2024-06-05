abstract class CreateAndManageOrganizationAdminsEvent {}

class CreateAndManageOrganizationAdminsUpdateEvent
    extends CreateAndManageOrganizationAdminsEvent {
  final int value;
  CreateAndManageOrganizationAdminsUpdateEvent({required this.value});
}
