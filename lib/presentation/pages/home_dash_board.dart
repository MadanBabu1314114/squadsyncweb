import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:lottie/lottie.dart';

// feat: Implement HomeDashBoard screen

// This commit introduces the HomeDashBoard screen, which serves as the main dashboard interface in the Flutter app. The screen features a DashBoardBackGround widget containing a ListView with a header row and a Lottie animation.

// The header row displays the title "Home DashBoard" using the HeadingForEveryFormScreen widget and provides user-related options via a PopMenuButtonForUser widget.

// The main content of the screen is a Lottie animation fetched from a network URL, wrapped inside a container with rounded corners.

// This screen enhances the user experience by presenting an aesthetically pleasing dashboard interface with interactive elements.

class HomeDashBoard extends StatelessWidget {
  const HomeDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardBackGround(
        screen: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingForEveryFormScreen(text: "Home DashBoard"),
                  PopMenuButtonForUser(
                    text: 'SUPER ADMIN',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    width: 600,
                    height: 600,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: LottieBuilder.network(
                      "https://lottie.host/4a8b7cca-0997-48ea-a178-2f64cd512a89/fC7mGIVawg.json",
                      animate: true,
                      addRepaintBoundary: true,
                      fit: BoxFit.cover,
                      backgroundLoading: true,
                      frameRate: FrameRate.composition,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
