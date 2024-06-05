import 'package:flutter/cupertino.dart';

class DashBoardBackGround extends StatelessWidget {
  const DashBoardBackGround({Key? key, required this.screen}) : super(key: key);
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/Background.png",
              ),
              fit: BoxFit.cover),
        ),
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          child: screen,
        ));
  }
}
