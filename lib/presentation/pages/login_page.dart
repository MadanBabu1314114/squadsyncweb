// feat: Implement LoginPage screen

// This commit introduces the LoginPage screen, which allows users to log in to the app. The screen consists of a SingleScreenBackGround widget containing a BackgroundForForms widget, which wraps a LoginForm widget.

// The LoginForm widget provides fields for entering username and password, along with a submit button. Upon submission, the LoginBloc is invoked to handle the login process, with appropriate events dispatched based on user input.

// The screen also includes a listener to display a loading banner when the login process is in progress, providing feedback to the user.

// This screen enhances the user experience by providing a seamless and intuitive interface for logging in to the app.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_event.dart';
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/background_for_forms.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart';
import 'package:squadsyncweb/presentation/widgets/website/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.isOrg}) : super(key: key);
  final bool isOrg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleScreenBackGround(
        screen: BackgroundForForms(
          content: BlocConsumer<LoginBloc, LoginState>(
            bloc: context.read<LoginBloc>(),
            listener: (context, state) {
              if (state is LoginLoading) {
                CustomMaterialBanner().show(context, "Wait Loading");
              }
            },
            builder: (context, state) {
              return Center(
                child: LoginForm(
                  submit: (username, password) {
                    context.read<LoginBloc>().add(LoginButtonPressed(
                          context,
                          username: username,
                          password: password,
                          isOrg: isOrg,
                        ));
                  },
                  isOrg: isOrg,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
