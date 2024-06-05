import 'package:flutter/material.dart'; // Importing necessary Flutter material package for UI components
import 'package:squadsyncweb/presentation/widgets/common/button_with_icon_for_back_and_user.dart'; // Importing a common widget for buttons with icons for back and user
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart'; // Importing a common widget for the pop-up menu button
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart'; // Importing a common widget for the single screen background
import 'package:squadsyncweb/presentation/widgets/website/change_password_form.dart'; // Importing widget for the change password form

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using the Scaffold widget for the overall page structure
      body: SingleScreenBackGround(
        // Using a common single screen background
        screen: Container(
          // Wrapping content in a Container
          child: ListView(
            // Wrapping content in a ListView for scrollability
            children: [
              Padding(
                padding:
                    const EdgeInsets.all(10.0), // Adding padding around the row
                child: Row(
                  // Creating a row for navigation buttons and menu
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Aligning items in the row
                  children: [
                    ButtonWithIconForBackAndUser(
                        // Using a button with icon for back and user
                        text: "BACK", // Setting button text
                        icon:
                            Image.asset('ORGANIZATION')), // Setting button icon
                    const PopMenuButtonForUser(
                      // Using a pop-up menu button for user options
                      text: 'USER', // Setting menu button text
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.all(10.0), // Adding padding around the row
                child: Row(
                  // Creating another row for navigation buttons and menu
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Aligning items in the row
                  children: [
                    ButtonWithIconForBackAndUser(
                        // Using a button with icon for back and user
                        text: "BACK", // Setting button text
                        icon: Image.asset(
                            'assets/images/back_icon.png')), // Setting button icon from assets
                    const PopMenuButtonForUser(
                      text: 'USER',
                    ), // Using a pop-up menu button for user options
                  ],
                ),
              ),
              const ChangePasswordForm(), // Adding the change password form widget
            ],
          ),
        ),
      ),
    );
  }
}
