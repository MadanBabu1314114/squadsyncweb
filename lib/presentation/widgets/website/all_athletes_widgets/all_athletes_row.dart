import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class AllAthletesRow extends StatelessWidget {
  const AllAthletesRow({Key? key, required this.firstName, required this.lastName, required this.organizatioName, required this.coachName, required this.athletesPrimaryEmail, required this.isSelected}) : super(key: key);
  final String firstName;
  final String lastName;
  final String organizatioName;
  final String coachName;
  final String athletesPrimaryEmail;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    gradient: isSelected
                        ? const LinearGradient(colors: [
                            Color.fromARGB(127, 251, 138, 0),
                            Color.fromARGB(122, 149, 82, 0),
                          ])
                        : const LinearGradient(colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ])),
                height: 30,
                child: Center(
                  child: Text(firstName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white, fontFamily: '')),
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
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    gradient: isSelected
                        ? const LinearGradient(colors: [
                            Color.fromARGB(127, 251, 138, 0),
                            Color.fromARGB(122, 149, 82, 0),
                          ])
                        : const LinearGradient(colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ])),
                height: 30,
                child: Center(
                  child: Text(lastName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white, fontFamily: '')),
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
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    gradient: isSelected
                        ? const LinearGradient(colors: [
                            Color.fromARGB(127, 251, 138, 0),
                            Color.fromARGB(122, 149, 82, 0),
                          ])
                        : const LinearGradient(colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ])),
                height: 30,
                child: Center(
                  child: Text(organizatioName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white, fontFamily: '')),
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
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    gradient: isSelected
                        ? const LinearGradient(colors: [
                            Color.fromARGB(127, 251, 138, 0),
                            Color.fromARGB(122, 149, 82, 0),
                          ])
                        : const LinearGradient(colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ])),
                height: 30,
                child: Center(
                  child: Text(coachName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white, fontFamily: '')),
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
              flex: 2,
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    gradient: isSelected
                        ? const LinearGradient(colors: [
                            Color.fromARGB(127, 251, 138, 0),
                            Color.fromARGB(122, 149, 82, 0),
                          ])
                        : const LinearGradient(colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ])),
                height: 30,
                child: Center(
                  child: Text(athletesPrimaryEmail,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white, fontFamily: '')),
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
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    gradient: isSelected
                        ? const LinearGradient(colors: [
                            Color.fromARGB(127, 251, 138, 0),
                            Color.fromARGB(122, 149, 82, 0),
                          ])
                        : const LinearGradient(colors: [
                            Color.fromARGB(0, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ])),
                height: 30,
                child: const Center(
                    child: Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 251, 138, 0),
                )),
              )),
        ],
      ),
    );
  }
}
