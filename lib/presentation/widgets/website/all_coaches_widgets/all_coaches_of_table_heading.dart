import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class AllCoachesOfTableHeading extends StatelessWidget {
  const AllCoachesOfTableHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text('REGISTERED STAFF',
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
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('FIRST NAME',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xFFFBA24F),
                          shadows: [
                            const BoxShadow(
                                color: Color(0xFFFBA24F),
                                blurRadius: 25,
                                offset: Offset(0, 4))
                          ],
                        )),
                  )),
              const DottedLine(
                dashColor: Color(0xFFB0CEFF),
                dashRadius: 80,
                lineLength: 30,
                dashLength: 1.5,
                lineThickness: 1.5,
                direction: Axis.vertical,
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('LAST NAME',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xFFFBA24F),
                          shadows: [
                            const BoxShadow(
                                color: Color(0xFFFBA24F),
                                blurRadius: 25,
                                offset: Offset(0, 4))
                          ],
                        )),
                  )),
              const DottedLine(
                dashColor: Color(0xFFB0CEFF),
                dashRadius: 80,
                lineLength: 30,
                dashLength: 1.5,
                lineThickness: 1.5,
                direction: Axis.vertical,
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('ORGANIZATION NAME',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xFFFBA24F),
                          shadows: [
                            const BoxShadow(
                                color: Color(0xFFFBA24F),
                                blurRadius: 25,
                                offset: Offset(0, 4))
                          ],
                        )),
                  )),
              const DottedLine(
                dashColor: Color(0xFFB0CEFF),
                dashRadius: 80,
                lineLength: 30,
                dashLength: 1.5,
                lineThickness: 1.5,
                direction: Axis.vertical,
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('COACH ID',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xFFFBA24F),
                          shadows: [
                            const BoxShadow(
                                color: Color(0xFFFBA24F),
                                blurRadius: 25,
                                offset: Offset(0, 4))
                          ],
                        )),
                  )),
              const DottedLine(
                dashColor: Color(0xFFB0CEFF),
                dashRadius: 80,
                lineLength: 30,
                dashLength: 1.5,
                lineThickness: 1.5,
                direction: Axis.vertical,
              ),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 30,
                    child: Center(
                      child: Text('COACH PRIMARY EMAIL',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color(0xFFFBA24F),
                            shadows: [
                              const BoxShadow(
                                  color: Color(0xFFFBA24F),
                                  blurRadius: 25,
                                  offset: Offset(0, 4))
                            ],
                          )),
                    ),
                  )),
              const DottedLine(
                dashColor: Color(0xFFB0CEFF),
                dashRadius: 80,
                lineLength: 30,
                dashLength: 1.5,
                lineThickness: 1.5,
                direction: Axis.vertical,
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 30,
                    child: Center(
                      child: Text('ACTIONS',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: const Color(0xFFFBA24F),
                            shadows: [
                              const BoxShadow(
                                  color: Color(0xFFFBA24F),
                                  blurRadius: 25,
                                  offset: Offset(0, 4))
                            ],
                          )),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
