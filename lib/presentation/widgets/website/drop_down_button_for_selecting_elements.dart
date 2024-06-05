import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropDownButtonForSelectingElements extends StatefulWidget {
  const DropDownButtonForSelectingElements({
    super.key,
    required this.controller,
    required this.labelText,
    required this.listOfItems,
  });

  final TextEditingController controller;
  final String labelText;
  final List<String> listOfItems;

  @override
  State<DropDownButtonForSelectingElements> createState() =>
      _DropDownButtonForSelectingElementsState();
}

class _DropDownButtonForSelectingElementsState
    extends State<DropDownButtonForSelectingElements> {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.labelText,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                "assets/images/text_field_website.png",
                filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
                width: widthScreen / 5,
                height: 70,
              ),
            ),
            Container(
              width: widthScreen / 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  cursorColor: Colors.white,
                  controller: widget.controller,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 30,
              child: Transform.rotate(
                  angle: pi / 2,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 90, 190, 236),
                    size: 35,
                  )),
            ),
            Container(
              width: widthScreen / 5,
              child: DropdownButton(
                value: null,
                focusColor: Colors.transparent,
                iconEnabledColor: Colors.transparent,
                iconDisabledColor: Colors.transparent,
                isExpanded: true,
                borderRadius: BorderRadius.circular(20),
                underline: const Icon(
                  Icons.abc,
                  color: Colors.transparent,
                ),
                items: widget.listOfItems
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e.toString())))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    widget.controller.text = value!;
                  });
                },
              ),
            )
          ],
        ),
      ],
    ));
  }
}
