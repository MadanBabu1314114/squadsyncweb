// feat: Implement CreateOrganizationBloc functionality

// This commit adds the CreateOrganizationBloc, which manages the process of creating organizations in the app. The bloc listens to CreateOrganizationEvent and emits corresponding CreateOrganizationState.

// The CreateOrganizationBloc includes a method to handle sending a request to create an organization. When a CreateOrganizationSendRequestEvent is triggered, the bloc emits CreateOrganizationLoadingState and sends a request to the data source to create the organization using the provided data.

// Upon receiving a response from the data source, the bloc updates the state to CreateOrganizationSuccessState, indicating that the organization creation process was successful.

// The CreateOrganizationBloc enhances the app's functionality by providing a structured approach to handle organization creation tasks.

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/common/data.dart';
import 'package:squadsyncweb/data/data_source/create_organization_data_source.dart';
import 'package:squadsyncweb/presentation/bloc/create_organization_bloc/create_organization_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_organization_bloc/create_organization_state.dart';

class CreateOrganizationBloc
    extends Bloc<CreateOrganizationEvent, CreateOrganizationState> {
  CreateOrganizationBloc() : super(CreateOrganizationInitialState()) {
    on<CreateOrganizationSendRequestEvent>(createOrganizationSendRequestEvent);
  }

  FutureOr<void> createOrganizationSendRequestEvent(
      CreateOrganizationSendRequestEvent event,
      Emitter<CreateOrganizationState> emit) async {
    emit(CreateOrganizationLoadingState());
    print(event.bearerToken);
    responseCreateOrganization = await CreateOrganizationDataSource()
        .createOrganization(event.address, event.organization,
            event.bearerToken, event.sports, event.context);
    emit(CreateOrganizationSuccessState());
  }
}
