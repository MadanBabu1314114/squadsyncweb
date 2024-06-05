import 'package:flutter/material.dart';

class ButtonWithIconForBackAndUser extends StatelessWidget {
  const ButtonWithIconForBackAndUser({Key? key, required this.text, required this.icon}) : super(key: key);
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8,),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
