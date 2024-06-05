import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldForText extends StatelessWidget {
  const TextFieldForText({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

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
