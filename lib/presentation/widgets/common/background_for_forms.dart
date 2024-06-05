import 'package:flutter/material.dart';

class BackgroundForForms extends StatelessWidget {
  const BackgroundForForms({Key? key, required this.content}) : super(key: key);
  final Widget content;

  @override
  Widget build(BuildContext context) {
     
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300 ),
      child: Container(
        height: 600,
        decoration: ShapeDecoration(
           color: const Color.fromARGB(126, 22, 22, 22),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Color.fromARGB(126, 22, 22, 22), width: 0.89),            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: content,
      ),
    );
  }
}


//  ShaderMask(
//         shaderCallback: (Rect bounds) {
//           return const LinearGradient(
//               begin: Alignment.bottomLeft,
//               end: Alignment.topRight,
//               colors: [
//                 Color.fromARGB(54, 255, 255, 255),
//                 Color.fromARGB(174, 23, 179, 132),
//                 Color.fromARGB(109, 255, 255, 255),
//                 Color.fromARGB(57, 21, 21, 21),
//                 Color.fromARGB(129, 255, 255, 255),
//                 Color.fromARGB(139, 23, 179, 132),
//                 Color.fromARGB(46, 255, 255, 255),
//               ]).createShader(bounds);
//         },