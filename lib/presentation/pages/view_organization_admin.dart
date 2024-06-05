// feat: Implement ViewOrganizationAdmin screen

// This commit introduces the ViewOrganizationAdmin screen, which allows super admins to view organization admins in the app. The screen consists of a DashBoardBackGround widget containing a ListView with a header row and a search bar.

// The header row displays the title "VIEW ORGANIZATION ADMIN" using the HeadingForEveryFormScreen widget and provides user options via a PopMenuButtonForUser widget.

// Below the header, the screen includes a search bar for filtering organization admins. The main content of the screen is wrapped within a container with rounded corners and includes a table heading for organization admin data.

// The table displays organization admin data using ViewOrganizationAdminRow widgets, with each row representing an organization admin. The data is populated dynamically based on the state managed by the ViewOrganizationAdminBloc.

// This screen enhances the user experience by providing an organized and efficient interface for viewing organization admins.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/view_organization_admin_bloc/view_organization_admin_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/view_organization_admin_bloc/view_organization_admin_event.dart';
import 'package:squadsyncweb/presentation/bloc/view_organization_admin_bloc/view_organization_admin_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/view_super_admin_data.dart';
import 'package:squadsyncweb/presentation/widgets/website/view_organization_admin_widgets/view_organization_admin_row.dart';
import 'package:squadsyncweb/presentation/widgets/website/view_organization_admin_widgets/view_organization_admin_search.dart';
import 'package:squadsyncweb/presentation/widgets/website/view_organization_admin_widgets/view_organization_admin_table_heading.dart';

class ViewOrganizationAdmin extends StatelessWidget {
  const ViewOrganizationAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardBackGround(
        screen: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingForEveryFormScreen(text: "VIEW ORAGNIZATION ADMIN"),
                  PopMenuButtonForUser(
                    text: 'SUPER ADMIN',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ViewOrganizationAdminSearch(),
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
                    const ViewOrganizationAdminTableHeading(),
                    SizedBox(
                      height: 500,
                      child: BlocConsumer<ViewOrganizationAdminBloc,
                          ViewOrganizationAdminState>(
                        bloc: context.read<ViewOrganizationAdminBloc>(),
                        listener: (context, state) {},
                        builder: (context, state) {
                          return ListView(
                            children: [
                              ...listOfNUmbers.map((e) => GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ViewOrganizationAdminBloc>()
                                          .add(ViewOrganizationAdminUpdateEvent(
                                              value: listOfNUmbers.indexOf(e)));
                                    },
                                    child: ViewOrganizationAdminRow(
                                      key: ObjectKey(
                                          listOfNUmbers.indexOf(e).toString()),
                                      isSelected: listOfNUmbers.indexOf(e) ==
                                          state.selectedRow,
                                      organizationAdminName:
                                          '${e.toString()} Madan',
                                      organizatonAdminPrimaryEmail:
                                          '${e.toString()}@gmail.com',
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
            )
          ],
        ),
      ),
    );
  }
}
