import 'package:flutter/material.dart';
class Task1Website extends StatelessWidget {
  const Task1Website({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 1"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(229, 136, 210, 244),
              Color.fromARGB(255, 213, 238, 184),
              Color.fromARGB(255, 215, 133, 160),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: widthScreen / 2,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(width: 2)),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hello I am a Bad",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text(
                      "klfhasd dkjf;adfadsf dfadf asdf lk ;lkdjfa ;lk ;kladjf a;lkj ;kj d;fkaj kj dfakj  ",
                      style: TextStyle(
                        leadingDistribution: TextLeadingDistribution.even
                      ),
                      softWrap: false,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                                             ),
                    Container(
                      width: widthScreen / 4,
                      height: heightScreen / 3,
                      decoration: const ShapeDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://thumbs.dreamstime.com/b/polar-bear-wallpaper-hd-wallpapers-ai-polar-bear-wallpaper-hd-wallpapers-297800380.jpg"),
                            fit: BoxFit.fill),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: const Text("Enter"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
