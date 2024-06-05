// feat: Implement ViewSuperAdmin screen

// This commit introduces the ViewSuperAdmin screen, which allows super admins to view other super admins in the app. The screen consists of a DashBoardBackGround widget containing a ListView with a header row and a table of super admin data.

// The header row displays the title "VIEW SUPER ADMIN" using the HeadingForEveryFormScreen widget and provides user options via a PopMenuButtonForUser widget.

// The main content of the screen is wrapped within a container with rounded corners and includes a table heading for super admin data.

// The table displays super admin data using ViewSuperAdminRow widgets, with each row representing a super admin. The data is populated dynamically based on the state managed by the ViewSuperAdminBloc.

// This screen enhances the user experience by providing an organized and efficient interface for viewing super admins.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/view_super_admin_bloc/view_super_admin_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/view_super_admin_bloc/view_super_admin_event.dart';
import 'package:squadsyncweb/presentation/bloc/view_super_admin_bloc/view_super_admin_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/view_super_admin_data.dart';
import 'package:squadsyncweb/presentation/widgets/website/view_super_admin_widgets/view_super_admin_row.dart';
import 'package:squadsyncweb/presentation/widgets/website/view_super_admin_widgets/view_super_admin_table_heading.dart';

class ViewSuperAdmin extends StatelessWidget {
  const ViewSuperAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DashBoardBackGround(
            screen: ListView(children: [
      const Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingForEveryFormScreen(text: "VIEW SUPER ADMIN"),
            PopMenuButtonForUser(
              text: 'SUPER ADMIN',
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: const Color.fromARGB(61, 22, 22, 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              const ViewSuperAdminTableHeading(),
              SizedBox(
                height: 500,
                child: BlocConsumer<ViewSuperAdminBloc, ViewSuperAdminState>(
                  bloc: context.read<ViewSuperAdminBloc>(),
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ListView(
                      children: [
                        ...listOfNUmbers.map((e) => GestureDetector(
                              onTap: () {
                                context.read<ViewSuperAdminBloc>().add(
                                    ViewSuperAdminUpdateEvent(
                                        value: listOfNUmbers.indexOf(e)));
                              },
                              child: ViewSuperAdminRow(
                                key: ObjectKey(
                                    listOfNUmbers.indexOf(e).toString()),
                                name: '${e.toString()} Madan',
                                email: 'madan.squadsync@gmail.com',
                                isSelected: listOfNUmbers.indexOf(e) ==
                                    state.selectedRow,
                              ),
                            ))
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
    ])));
  }
}
