import 'package:flutter/material.dart';

class AddOrganizationAdminTextField extends StatelessWidget {
  const AddOrganizationAdminTextField(
      {Key? key, required this.heading, required this.labelText})
      : super(key: key);
  final String heading;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.white),
        ),
        Container(
          width: 300,
          height: 30,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/small_text_field.png"),
                fit: BoxFit.fill),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: TextField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white, fontFamily: ''),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: labelText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
