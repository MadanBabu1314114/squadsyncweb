import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CreateAndManageOrganizationAdminsRow extends StatelessWidget {
  const CreateAndManageOrganizationAdminsRow(
      {Key? key,
      required this.organizationName,
      required this.organizationPrimaryAdminEmail,
      required this.isSelected,
      required this.organizationAdminName})
      : super(key: key);
  final String organizationName;
  final String organizationAdminName;
  final String organizationPrimaryAdminEmail;
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
                  child: Text(organizationName,
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
                  child: Text(organizationAdminName,
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
                  child: Text(organizationPrimaryAdminEmail,
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
