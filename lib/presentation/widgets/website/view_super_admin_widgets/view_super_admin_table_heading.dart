import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewSuperAdminTableHeading extends StatelessWidget {
  const ViewSuperAdminTableHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text('SQUAD SYNC SUPER ADMIN',
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
        Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 30),
                height: 30,
                child: Text('NAME',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                  child: Container(
                margin: const EdgeInsets.only(left: 30),
                height: 30,
                child: Text('E-MAIL',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFFFBA24F),
                      shadows: [
                        const BoxShadow(
                            color: Color(0xFFFBA24F),
                            blurRadius: 25,
                            offset: Offset(0, 4))
                      ],
                    )),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
