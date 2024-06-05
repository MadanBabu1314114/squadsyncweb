import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonForDate extends StatefulWidget {
  const ButtonForDate({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  State<ButtonForDate> createState() => _ButtonForDateState();
}

class _ButtonForDateState extends State<ButtonForDate> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.controller) {
      setState(() {
        widget.controller.text = picked.year.toString();
      });
    }
  }

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
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Stack(
            
            alignment: Alignment.center,
            children: [
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
              SizedBox(
                child: Image.asset(
                  "assets/images/text_field_website.png",
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.fill,
                  width: widthScreen / 5,
                  height: 70,
                ),
              ),
              SizedBox(
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
            ],
          ),
        ),
      ],
    ));
  }
}
