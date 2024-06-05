import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/common/background_for_forms.dart';
import 'package:squadsyncweb/presentation/widgets/common/button_with_icon_for_back_and_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart';
import 'package:squadsyncweb/presentation/widgets/website/add_organization_admin_widgets/add_organization_admin_text_field.dart';
import 'package:squadsyncweb/presentation/widgets/website/submit_for_login.dart';

/// Organization Admin Add Screen
///
/// This screen is used to add new organization admin.
/// It contains text fields for first name, last name,
/// phone number, email, and organization.
/// It also contains a submit button to create the admin.
class AddOrganizationAdmin extends StatelessWidget {
  const AddOrganizationAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleScreenBackGround(
        screen: Column(
          children: [
            // Back and user menu
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIconForBackAndUser(
                    text: "BACK",
                    icon: Image.asset('assets/images/back_icon.png'),
                  ),
                  const PopMenuButtonForUser(
                    text: 'USER',
                  ),
                ],
              ),
            ),
            // Form content
            BackgroundForForms(
              content: Column(
                children: [
                  // Heading
                  const HeadingForEveryFormScreen(
                    text: "ADD ORGANIZATION ADMIN",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: double.infinity,
                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              // First Name Text Field
                              AddOrganizationAdminTextField(
                                heading: "ADMIN FIRST NAME",
                                labelText: "",
                              ),
                              // Phone Number Text Field
                              AddOrganizationAdminTextField(
                                heading: "PHONE NUMBER",
                                labelText: "",
                              ),
                              // Organization Text Field
                              AddOrganizationAdminTextField(
                                heading: "CHOSE THE ORGANIZATION",
                                labelText: "",
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              // Last Name Text Field
                              AddOrganizationAdminTextField(
                                heading: "ADMIN LAST NAME",
                                labelText: "",
                              ),
                              // Email Text Field
                              AddOrganizationAdminTextField(
                                heading: "E-MAIL ID",
                                labelText: "",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Submit Button
                  const SubmitForLogin(labelText: "CREATE")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
