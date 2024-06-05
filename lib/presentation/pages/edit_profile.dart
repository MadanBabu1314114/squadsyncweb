import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/common/button_with_icon_for_back_and_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart';
import 'package:squadsyncweb/presentation/widgets/website/edit_profile_widgets/edit_profile_form.dart';

// feat: Implement EditProfile screen

// This commit adds the EditProfile screen, which allows users to edit their profile information. The screen consists of a SingleScreenBackGround widget containing a ListView with a header row. The header row contains a ButtonWithIconForBackAndUser widget for navigating back and accessing user-related options via a PopMenuButtonForUser.

// The main content of the screen is represented by the EditProfileForm widget, which provides a form for users to edit their profile details.

// This screen enhances the user experience by providing a dedicated interface for profile editing within the app.

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleScreenBackGround(
        screen: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIconForBackAndUser(
                      text: "BACK",
                      icon: Image.asset('assets/images/back_icon.png')),
                  const PopMenuButtonForUser(
                    text: 'USER',
                  )
                ],
              ),
            ),
            const EditProfileForm()
          ],
        ),
      ),
    );
  }
}
