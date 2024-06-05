import 'package:flutter/material.dart';

class TextFieldForEditProfile extends StatelessWidget {
  const TextFieldForEditProfile(
      {Key? key, required this.heading, required this.controller})
      : super(key: key);

  final String heading;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              heading,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          Stack(alignment: Alignment.topLeft, children: [
            Container(
              child: Image.asset(
                'assets/images/small_text_field.png',
                filterQuality: FilterQuality.low,
                alignment: Alignment.centerLeft,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 70),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 255, 255, 255),
                cursorHeight: 15,
                controller: controller,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontFamily: ''),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
