import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/common/data.dart';
import 'package:squadsyncweb/data/data_source/create_org_admin_data_source.dart';
import 'package:squadsyncweb/data/data_source/retrieveing_org_list.dart';
import 'package:squadsyncweb/presentation/bloc/create_org_admin_bloc/create_org_admin_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_org_admin_bloc/create_org_admin_state.dart';

class CreateOrgAdminBloc
    extends Bloc<CreateOrgAdminEvent, CreateOrgAdminState> {
  CreateOrgAdminBloc() : super(CreateOrgAdminInitialState()) {
    on<CreateOrgAdminRetrieveListOrgEvent>(createOrgAdminRetrieveListOrgEvent);
    on<CreateOrgAdminSendRequestEvent>(createOrgAdminSendRequestEvent);
  }

  FutureOr<void> createOrgAdminSendRequestEvent(
      CreateOrgAdminSendRequestEvent event,
      Emitter<CreateOrgAdminState> emit) async {
    emit(CreateOrgAdminLoadingState());

    responseCreateOrgAdmin = await CreateOrgAdminDataSource().createOrgAdmin(
        event.bearerToken,
        event.address,
        event.education,
        event.personRole,
        event.person,
        event.context);
    emit(CreateOrgAdminSuccessState());
  }

  FutureOr<void> createOrgAdminRetrieveListOrgEvent(
      CreateOrgAdminRetrieveListOrgEvent event,
      Emitter<CreateOrgAdminState> emit) async {
    emit(CreateOrgAdminLoadingState());
    print("Bearer Token: " +
        userTokenBox.getAt(userTokenBox.length - 1)!.accessToken);
    print(userTokenBox.getAt(userTokenBox.length - 1)!.accessToken);
    listOfOrg = await RetrieveingOrgList().fetchOrganizations(
        userTokenBox.getAt(userTokenBox.length - 1)!.accessToken);
    emit(CreateOrgAdminSuccessState());
  }
}
