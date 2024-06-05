import 'package:flutter/material.dart';

class LoginBackgroundImage extends StatelessWidget {
  const LoginBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Container(
      width: widthScreen,
      height: heightScreen,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://wallpaperbat.com/img/482299-abstract-art-colorful-colors-design-illustration-light-theme-wallpaper-1920x1080.jpg",
              ),
              fit: BoxFit.cover)),
    );
  }
}
