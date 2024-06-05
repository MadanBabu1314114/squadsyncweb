import 'package:flutter/material.dart';

class SubmitForLogin extends StatelessWidget {
  const SubmitForLogin({Key? key, required this.labelText}) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      decoration: ShapeDecoration(
          image: const DecorationImage(
              image: AssetImage(
                "assets/images/submit_btn.png",
              ),
              fit: BoxFit.fill),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          labelText,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
