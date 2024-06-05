import 'package:flutter/material.dart';

class HeadingForEveryFormScreen extends StatelessWidget {
  const HeadingForEveryFormScreen({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              shadows: [
                const BoxShadow(color: Color(0xFF98DEE6), blurRadius: 25)
              ],
              decoration: TextDecoration.underline,
              decorationColor: Colors.white),
        ),
      ],
    );
  }
}
