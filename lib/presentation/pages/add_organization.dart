import 'package:flutter/material.dart';
import 'package:squadsyncweb/presentation/widgets/common/background_for_forms.dart';
import 'package:squadsyncweb/presentation/widgets/common/button_with_icon_for_back_and_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart';
import 'package:squadsyncweb/presentation/widgets/website/submit_for_login.dart';

/// This class is a screen to add organization
///
/// It contains a heading for add organization
/// And two text fields for organization name and organization type
/// And a submit button to create the organization
class AddOrganization extends StatelessWidget {
  const AddOrganization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleScreenBackGround(
        screen: Column(
          children: [
            // Back button and user button
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
                  ),
                ],
              ),
            ),
            // Organization name text field
            BackgroundForForms(
              content: Column(
                children: [
                  const HeadingForEveryFormScreen(text: "ADD ORGANIZATION"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ENTER ORGANIZATION NAME",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.white),
                        ),
                        Container(
                          width: 491,
                          height: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/small_text_field.png"),
                                fit: BoxFit.fill),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const TextField(
                              style: TextStyle(
                                  color: Colors.white, fontFamily: ''),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'xxx',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Organization type dropdown
                        Text(
                          "ORGANIZATION TYPE",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.white),
                        ),
                        Container(
                          width: 491,
                          height: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/small_text_field.png"),
                                fit: BoxFit.fill),
                          ),
                          child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: DropdownButton(
                                isExpanded: true,
                                icon: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: Color(0xFF64A5B4),
                                      size: 30,
                                    )),
                                underline: const Icon(
                                  Icons.dnd_forwardslash,
                                  color: Colors.transparent,
                                ),
                                value: "as",
                                borderRadius: BorderRadius.circular(20),
                                dropdownColor: Colors.black87,
                                style: const TextStyle(color: Colors.white),
                                items: ['as', 'sd', 'df']
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e.toString())))
                                    .toList(),
                                onChanged: (value) {},
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Submit button
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
