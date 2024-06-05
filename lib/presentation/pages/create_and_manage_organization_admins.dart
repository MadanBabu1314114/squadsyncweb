import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_admins_bloc/create_and_manage_organization_admins_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_admins_bloc/create_and_manage_organization_admins_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_admins_bloc/create_and_manage_organization_admins_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/view_super_admin_data.dart';
import 'package:squadsyncweb/presentation/widgets/website/create_manage_organization_admin_widgets/create_and_manage_organization_admins_of_table_heading.dart';
import 'package:squadsyncweb/presentation/widgets/website/create_manage_organization_admin_widgets/create_and_manage_organization_admins_row.dart';
import 'package:squadsyncweb/presentation/widgets/website/create_manage_organization_admin_widgets/create_and_manage_organization_admins_search.dart';

class CreateAndManageOrganizationAdmins extends StatelessWidget {
  const CreateAndManageOrganizationAdmins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add the comment for the commit
    return Scaffold(
      body: DashBoardBackGround(
        screen: ListView(
          children: [
            // Add the comment for the commit
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingForEveryFormScreen(
                      text: "CREATE AND MANAGE ORGANIZATION ADMINS"),
                  PopMenuButtonForUser(
                    text: 'SUPER ADMIN',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Add the comment for the commit
            const CreateAndManageOrganizationAdminsSearch(),
            const SizedBox(
              height: 10,
            ),
            // Add the comment for the commit
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
                child: Column(children: [
                  // Add the comment for the commit
                  const CreateAndManageOrganizationAdminsOfTableHeading(),
                  SizedBox(
                    height: 500,
                    child: BlocConsumer<CreateAndManageOrganizationAdminsBloc,
                        CreateAndManageOrganizationAdminsState>(
                      bloc:
                          context.read<CreateAndManageOrganizationAdminsBloc>(),
                      listener: (context, state) {},
                      builder: (context, state) {
                        // Add the comment for the commit
                        return ListView(
                          children: [
                            ...listOfNUmbers.map((e) => GestureDetector(
                                  onTap: () {
                                    context
                                        .read<
                                            CreateAndManageOrganizationAdminsBloc>()
                                        .add(
                                            CreateAndManageOrganizationAdminsUpdateEvent(
                                                value:
                                                    listOfNUmbers.indexOf(e)));
                                  },
                                  child: CreateAndManageOrganizationAdminsRow(
                                    organizationName: '${e.toString()} sky',
                                    organizationPrimaryAdminEmail:
                                        'admin@gmail.com',
                                    isSelected: listOfNUmbers.indexOf(e) ==
                                        state.selectedRow,
                                    organizationAdminName: 'Madan',
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
