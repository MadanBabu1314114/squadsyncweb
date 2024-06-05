import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:squadsyncweb/presentation/widgets/common/button_with_icon_for_back_and_user.dart';

class PopMenuButtonForUser extends StatelessWidget {
  const PopMenuButtonForUser({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      surfaceTintColor: const Color(0xFF1A1F37),
      shadowColor: const Color.fromARGB(255, 149, 154, 175),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: ButtonWithIconForBackAndUser(
              text: "EDIT PROFILE",
              icon: Container(
                  width: 35,
                  height: 35,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.lightBlue),
                  child: const Icon(
                    Icons.edit_note_sharp,
                    color: Colors.white,
                  ))),
        ),
        PopupMenuItem(
          value: 2,
          child: ButtonWithIconForBackAndUser(
              text: "CHANGE PASSWORD",
              icon: Container(
                  width: 35,
                  height: 35,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.lightBlue),
                  child: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ))),
        ),
        PopupMenuItem(
          value: 3,
          child: ButtonWithIconForBackAndUser(
              text: "LOGOUT",
              icon: Container(
                  width: 35,
                  height: 35,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.lightBlue),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))),
        )
      ],
      offset: const Offset(0, 40),
      color: const Color(0xFF1A1F37),
      elevation: 2,
      onSelected: (value) {
        if (value == 1) {
          context.go('/edit-profile');
        } else if (value == 2) {
          context.go('/change-password');
        } else {
          context.go('/');
        }
      },
      child: ButtonWithIconForBackAndUser(
          text: text,
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          )),
    );
  }
}
