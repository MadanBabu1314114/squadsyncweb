import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:squadsyncweb/presentation/widgets/common/background_for_forms.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/website/edit_profile_widgets/edit_profile_address_text_field.dart';
import 'package:squadsyncweb/presentation/widgets/website/edit_profile_widgets/edit_profile_text_field.dart';

import 'package:squadsyncweb/presentation/widgets/website/submit_for_login.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BackgroundForForms(
      content: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          HeadingForEveryFormScreen(text: "EDIT SCREEN"),
          SizedBox(
            height: 10,
          ),
          EditProfileTextField(heading: "FIRST NAME", labelText: ""),
          EditProfileTextField(heading: "LAST NAME", labelText: ""),
          EditProfileTextField(heading: "E-MAIL", labelText: ""),
          EditProfileTextField(heading: "PHONE", labelText: ""),
          EditProfileAddressTextField(heading: "ADDRESS", labelText: ""),
          Spacer(),
          SubmitForLogin(labelText: "SAVE CHANGES"),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
