import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleScreenBackGround extends StatelessWidget {
  const SingleScreenBackGround({Key? key, required this.screen})
      : super(key: key);

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
            width: widthScreen,
            height: heightScreen,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Container(
                          width: widthScreen,
                          height: heightScreen,
                          child: Image.asset(
                            "assets/images/Background.png",
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          child: Image.asset(
                              width: widthScreen / 4,
                              height: heightScreen / 2,
                              alignment: Alignment.bottomLeft,
                              "assets/images/173575-vector-football-free-transparent-image-hq 4 (1).png")),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                              width: widthScreen / 4,
                              height: heightScreen / 2,
                              alignment: Alignment.bottomRight,
                              "assets/images/173575-vector-football-free-transparent-image-hq 4.png")),
                      screen
                    ],
                  ),
                ),
              ],
            )));
  }
}
