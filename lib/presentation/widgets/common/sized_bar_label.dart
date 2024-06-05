import 'package:flutter/material.dart';

class SizedBarLabel extends StatelessWidget {
  const SizedBarLabel({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  final String label;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(5),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF955100),
                      Color(0xFFFB8800),
                    ],
                  )
                : const LinearGradient(
                    colors: [Colors.transparent, Colors.transparent],
                  ),
            shadows: isSelected
                ? const [BoxShadow(color: Color(0xFF000000), blurRadius: 2)]
                : [
                    const BoxShadow(
                        color: Color.fromARGB(0, 0, 0, 0), blurRadius: 2)
                  ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.lightBlue),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              label,
              softWrap: true,
              overflow: TextOverflow.clip,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ))
          ],
        ));
  }
}
