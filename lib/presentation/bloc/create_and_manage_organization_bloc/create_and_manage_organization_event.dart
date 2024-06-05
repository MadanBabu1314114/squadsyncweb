abstract class CreateAndManageOrganizationEvent {}

class CreateAndManageOrganizationUpdateEvent extends CreateAndManageOrganizationEvent {
  final int value;
  CreateAndManageOrganizationUpdateEvent({required this.value});
}
