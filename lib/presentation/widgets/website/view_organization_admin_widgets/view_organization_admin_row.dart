import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class ViewOrganizationAdminRow extends StatelessWidget {
  const ViewOrganizationAdminRow(
      {Key? key,
      required this.organizationAdminName,
      required this.organizatonAdminPrimaryEmail,
      required this.isSelected})
      : super(key: key);
  final String organizationAdminName;
  final String organizatonAdminPrimaryEmail;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
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
            child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Text(organizationAdminName,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontFamily: '',
                      fontWeight: FontWeight.w400)),
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
              child: Container(
            height: 30,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                gradient: isSelected
                    ? const LinearGradient(colors: [
                        Color.fromARGB(143, 251, 138, 0),
                        Color.fromARGB(138, 149, 82, 0),
                      ])
                    : const LinearGradient(colors: [
                        Color.fromARGB(0, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ])),
            child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Text(organizatonAdminPrimaryEmail,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontFamily: '',
                      fontWeight: FontWeight.w400)),
            ),
          ))
        ],
      ),
    );
  }
}
