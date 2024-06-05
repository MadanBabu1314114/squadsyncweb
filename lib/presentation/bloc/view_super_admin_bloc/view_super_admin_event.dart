abstract class ViewSuperAdminEvent {}

class ViewSuperAdminUpdateEvent extends ViewSuperAdminEvent {
  final int value;
  ViewSuperAdminUpdateEvent({required this.value});
}
