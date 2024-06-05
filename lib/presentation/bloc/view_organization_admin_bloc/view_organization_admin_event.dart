abstract class ViewOrganizationAdminEvent {}

class ViewOrganizationAdminUpdateEvent extends ViewOrganizationAdminEvent {
  final int value;
  ViewOrganizationAdminUpdateEvent({required this.value});
}
