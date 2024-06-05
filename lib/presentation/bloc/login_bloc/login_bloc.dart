// feat: Implement LoginBloc functionality

// This commit adds the LoginBloc, responsible for managing the login process in the app. The bloc listens to LoginEvent and emits corresponding LoginState.

// The LoginBloc includes a method to handle login button presses. When a LoginButtonPressed event is triggered, the bloc emits LoginLoading state and initiates the login process.

// If the user is an organization admin, the bloc communicates with the LoginDataSource to authenticate the organization admin's credentials. Upon successful authentication, the user token is stored, and the app navigates to the homepage.

// For regular users, the LoginBloc uses the provided LoginUseCase to authenticate user credentials. Upon successful authentication, the user token is stored, and the app navigates to the homepage.

// The LoginBloc enhances the app's functionality by providing a structured approach to handle login-related tasks.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:squadsyncweb/bussiness/entity/user.dart';
import 'package:squadsyncweb/bussiness/usecase/login_usecase.dart';
import 'package:squadsyncweb/common/data.dart';
import 'package:squadsyncweb/data/data_source/login_data_source.dart';
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_event.dart';
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase useCase;
  LoginBloc({required this.useCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>(loginButtonPressd);
  }

  FutureOr<void> loginButtonPressd(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    if (event.isOrg) {
      await LoginDataSource()
          .loginOrgAdmin(event.username, event.password, event.context)
          .then((value) {
        userToken = UserToken(accessToken: value.access_token);
        userTokenBox.add(UserToken(accessToken: userToken.accessToken));
      });
    } else {
      userToken = await useCase.loginUser(
        event.username,
        event.password,
        event.context,
      );
      userTokenBox.add(UserToken(accessToken: userToken.accessToken));
    }
    if (userTokenBox.getAt(userTokenBox.length - 1)!.accessToken.isNotEmpty) {
      CustomMaterialBanner().show(event.context, "Successfully Login");
      await Future.delayed(const Duration(seconds: 1));
      event.context.go('/homepage');
    }
  }
}
