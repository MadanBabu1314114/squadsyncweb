// feat: Implement SelectedModuleForOrganization screen

// This commit adds the SelectedModuleForOrganization screen, which allows users to select modules for an organization. The screen includes a SingleScreenBackGround widget containing a row with a back button and user options via a PopMenuButtonForUser widget.

// The main content of the screen is wrapped within a BackgroundForForms widget and includes a heading for the form screen. Below the heading, there's a list of modules represented by SelectedForModelOrganizationRow widgets, each allowing the user to toggle the selection state.

// At the bottom of the screen, there's a SubmitForLogin widget for saving the changes made to the module selections.

// This screen provides a user-friendly interface for managing organization modules efficiently.

import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/common/background_for_forms.dart';
import 'package:squadsyncweb/presentation/widgets/common/button_with_icon_for_back_and_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart';
import 'package:squadsyncweb/presentation/widgets/website/selected_for_module_oranganization_widgets/selected_for_model_organization_row.dart';
import 'package:squadsyncweb/presentation/widgets/website/submit_for_login.dart';

class SelectedModuleForOrganization extends StatelessWidget {
  const SelectedModuleForOrganization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleScreenBackGround(
            screen: Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWithIconForBackAndUser(
                text: "BACK", icon: Image.asset('assets/images/back_icon.png')),
            const PopMenuButtonForUser(
              text: 'USER',
            ),
          ],
        ),
      ),
      BackgroundForForms(
          content: Column(children: [
        const HeadingForEveryFormScreen(text: "SELECT MODULE FOR ORGANIZATION"),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 200),
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectedForModelOrganizationRow(
                isChecked: false,
                description: "Athlete physical performance and assesment",
                changeMethod: (p0) {},
              ),
              SelectedForModelOrganizationRow(
                isChecked: false,
                description: "Athlete tactical understanding assesment",
                changeMethod: (p0) {},
              ),
              SelectedForModelOrganizationRow(
                isChecked: false,
                description: "Athlete readliness assesment",
                changeMethod: (p0) {},
              ),
              SelectedForModelOrganizationRow(
                isChecked: false,
                description: "Athlete mental assesment",
                changeMethod: (p0) {},
              ),
              SelectedForModelOrganizationRow(
                isChecked: false,
                description: "Athlete nutrition and hydration assesment",
                changeMethod: (p0) {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const SubmitForLogin(labelText: "Save CHanges")
      ]))
    ])));
  }
}
