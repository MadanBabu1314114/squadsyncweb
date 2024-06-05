// feat: Implement SignupPage screen

// This commit introduces the SignupPage screen, which allows users to sign up for the app. The screen features a background image using the LoginBackgroundImage widget and displays the signup form using the SignupForm widget.

// The SignupForm widget provides fields for entering user registration details, such as email, password, and other relevant information.

// The screen layout is designed to occupy the entire screen width and height using MediaQuery to dynamically calculate screen dimensions.

// This screen provides an intuitive and user-friendly interface for new users to register for the app.

import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/website/login_background_image.dart';
import 'package:squadsyncweb/presentation/widgets/website/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: widthScreen,
        height: heightScreen,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const LoginBackgroundImage(),
            SignupForm(updateScreen: () {})
          ],
        ),
      ),
    );
  }
}
