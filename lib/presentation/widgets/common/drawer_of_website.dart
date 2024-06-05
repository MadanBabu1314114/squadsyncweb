import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:squadsyncweb/presentation/widgets/common/dashboard_side_bar.dart';
import 'package:squadsyncweb/presentation/widgets/common/sized_bar_label.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:math' as math;

class DrawerOfWebsite extends StatelessWidget {
  const DrawerOfWebsite({
    super.key,
    required this.changeTheRoute,
    required this.currentScreen,
  });

  final int currentScreen;
  final Function(int) changeTheRoute;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen / 7,
      height: double.infinity,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(216, 6, 11, 38),
              Color(0xFF060B26),
            ],
          )),
      child: ListView(
        children: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
            onPressed: () {
              context.go('/');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/EYE-NEW-SEE -MDF 3.png",
                      height: 80,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: RepaintBoundary(
                        child: GradientText(
                          "SQUAD SYNC",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Colors.white,
                                  letterSpacing: 4,
                                  shadows: [
                                const Shadow(
                                    color: Color(0xFFF1E8B8), blurRadius: 25)
                              ]),
                          colors: [
                            0xFF6AF5ED,
                            0xFF2D64AF,
                            0xFF6DCFEE,
                            0xFF2D64AF,
                            0xFF6AF5ED,
                          ].map((e) => Color(e)).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 16, 17, 18),
                    Color(0xFFE0E1E2),
                    Color.fromARGB(255, 17, 19, 21)
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          ...listOfDashBoardItem.map((e) => Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {
                    changeTheRoute(listOfDashBoardItem.indexOf(e));
                  },
                  child: SizedBarLabel(
                      label: e.text,
                      icon: e.icon,
                      isSelected:
                          listOfDashBoardItem.indexOf(e) == currentScreen),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: 50,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: const Color(0xFF1A1F37)),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.lightBlue),
                        child: Transform.rotate(
                          angle: -math.pi,
                          child: const Icon(
                            Icons.login_rounded,
                            textDirection: TextDirection.rtl,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                          child: Text(
                        "Login",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                      ))
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
