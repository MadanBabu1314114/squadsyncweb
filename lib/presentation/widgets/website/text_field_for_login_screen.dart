import 'package:flutter/material.dart';

class TextFieldForLoginScreen extends StatelessWidget {
  const TextFieldForLoginScreen(
      {Key? key, required this.controller, required this.labelText})
      : super(key: key);
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                "assets/images/textFiledButton.png",
                filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
                width: widthScreen / 4 - 10,
                height: 60,
              ),
            ),
            Positioned(
              top: 0,
              left: 30,
              child: Text(
                labelText,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              width: widthScreen / 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(

                  cursorColor: const Color.fromARGB(255, 255, 255, 255),
                   
                  controller: controller,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255)  , fontFamily: ''),
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
