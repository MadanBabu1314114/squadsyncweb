import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
class AddUsersOfTableRow extends StatelessWidget {
  const AddUsersOfTableRow({Key? key, required this.listOfItems})
      : super(key: key);
  final List<String> listOfItems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
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
                                  Text(
                                    e,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontFamily: '',
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                  ),
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
                            Text(
                              e,
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontFamily: '',
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
