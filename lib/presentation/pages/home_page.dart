// feat: Implement HomePage screen

// This commit introduces the HomePage screen, which serves as the landing page of the Flutter app. The screen features a background image using the LoginBackgroundImage widget and displays the app name "Squad Sync" at the center of the screen.

// The screen layout is designed to occupy the entire screen width and height using MediaQuery to dynamically calculate screen dimensions.

// This screen provides an attractive and engaging introduction to the app, setting the stage for further user interaction.

import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/website/login_background_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          Center(
            child: Text(
              "Squad Sync",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    ));
  }
}
