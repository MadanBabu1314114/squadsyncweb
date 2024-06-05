import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddUserOfTableHeading extends StatelessWidget {
  const AddUserOfTableHeading({Key? key, required this.listOfItems})
      : super(key: key);
  final List<String> listOfItems;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: Text('DATA FROM YOUR ROLE',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: const Color(0xFFFBA24F),
              shadows: [
                const BoxShadow(
                    color: Color(0xFFFBA24F),
                    blurRadius: 25,
                    offset: Offset(0, 4))
              ],
            )),
      ),
      const DottedLine(
        dashColor: Color(0xFFB0CEFF),
        lineLength: double.infinity,
        dashRadius: 80,
        dashLength: 1.5,
        lineThickness: 1.5,
        direction: Axis.horizontal,
      ),
      SizedBox(
          width: double.infinity,
          child: Row(children: [
            ...listOfItems.map(
              (e) => listOfItems.indexOf(e) != listOfItems.length - 1
                  ? Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(e,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                          color: const Color(0xFFFBA24F),
                                          shadows: [
                                            const BoxShadow(
                                                color: Color(0xFFFBA24F),
                                                blurRadius: 25,
                                                offset: Offset(0, 4))
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const DottedLine(
                            dashColor: Color(0xFFB0CEFF),
                            dashRadius: 80,
                            lineLength: 30,
                            dashLength: 1.5,
                            lineThickness: 1.5,
                            direction: Axis.vertical,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(e,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                    color: const Color(0xFFFBA24F),
                                    shadows: [
                                      const BoxShadow(
                                          color: Color(0xFFFBA24F),
                                          blurRadius: 25,
                                          offset: Offset(0, 4))
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
            )
          ]))
    ]);
  }
}
