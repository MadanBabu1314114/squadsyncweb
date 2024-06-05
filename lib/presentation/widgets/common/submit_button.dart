import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen / 6,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xFF060B26), Color(0xFF1A1F37)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0.74, 0.5]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
