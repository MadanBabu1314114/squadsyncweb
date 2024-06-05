import 'package:flutter/material.dart';

class AddUsersOfUpload extends StatelessWidget {
  const AddUsersOfUpload({Key? key, required this.text, required this.icon, required this.method})
      : super(key: key);
  final String text;
  final IconData icon;
  final Function() method;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(5),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            surfaceTintColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            )),
        onPressed: method,
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: ShapeDecoration(
                color: const Color(0xFF0075FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: const Color(0xFF1B59F8)),
            ),
          ],
        ),
      ),
    );
  }
}
