import 'package:flutter/material.dart';

class EditProfileAddressTextField extends StatelessWidget {
  const EditProfileAddressTextField({Key? key, required this.heading, required this.labelText}) : super(key: key);

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
           width: 500,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/small_text_field.png"),
                fit: BoxFit.fill),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(10),
            child: TextField(
               maxLines: 10,
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
