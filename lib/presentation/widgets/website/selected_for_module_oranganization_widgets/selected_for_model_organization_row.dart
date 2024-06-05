import 'package:flutter/material.dart';

class SelectedForModelOrganizationRow extends StatelessWidget {
  const SelectedForModelOrganizationRow(
      {Key? key,
      required this.isChecked,
      required this.description,
      required this.changeMethod})
      : super(key: key);
  final bool isChecked;
  final String description;
  final Function(bool) changeMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: const BorderSide(
                    color: Color(0xFF01CEF5),
                    width: 2,
                  )),
            ),
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                changeMethod(value!);
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
