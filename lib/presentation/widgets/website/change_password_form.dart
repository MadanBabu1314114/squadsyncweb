import 'package:flutter/material.dart';

import 'package:squadsyncweb/presentation/widgets/common/background_for_forms.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';

import 'package:squadsyncweb/presentation/widgets/website/submit_for_login.dart';
import 'package:squadsyncweb/presentation/widgets/website/text_field_for_change_password.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundForForms(
      content: Column(
        children: [
          const HeadingForEveryFormScreen(text: 'CHANGE PASSWORD'),
          const SizedBox(
            height: 20,
          ),
          TextFieldForChangePassword(
              heading: 'OLD PASSWORD', controller: TextEditingController()),
          TextFieldForChangePassword(
              heading: 'NEW PASSWORD', controller: TextEditingController()),
          TextFieldForChangePassword(
              heading: 'CONFIRM PASSWORD', controller: TextEditingController()),
          const SizedBox(
            height: 20,
          ),
          const SubmitForLogin(labelText: "CHANGE PASSWORD")
        ],
      ),
    );
  }
}
