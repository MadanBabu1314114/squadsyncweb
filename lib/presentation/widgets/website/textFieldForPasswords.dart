import 'package:flutter/material.dart';

class TextFieldForPasswords extends StatelessWidget {
  const TextFieldForPasswords({
    super.key,
    required this.controller,
    required this.labelText,
    required this.isShowPassword,
  });
  final TextEditingController controller;
  final String labelText;
  final bool isShowPassword;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                "assets/images/text_field_website.png",
                filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
                width: widthScreen / 5,
                height: 70,
              ),
            ),
            Container(
              width: widthScreen / 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  cursorColor: Colors.white,
                  obscureText: isShowPassword,
                  controller: controller,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
