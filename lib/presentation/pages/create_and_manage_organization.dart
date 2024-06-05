import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_bloc/create_and_manage_organization_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_bloc/create_and_manage_organization_state.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_bloc/create_manage_organization_bloc.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/view_super_admin_data.dart';
import 'package:squadsyncweb/presentation/widgets/website/create_and_manage_organization_widgets/create_and_manage_organization_of_table_heading.dart';
import 'package:squadsyncweb/presentation/widgets/website/create_and_manage_organization_widgets/create_and_manage_organization_row.dart';
import 'package:squadsyncweb/presentation/widgets/website/create_and_manage_organization_widgets/create_and_manage_organization_search.dart';

//Added functionality for creating and managing organizations.
// Implemented UI components including headings, search bar, and organization table.
// Integrated Bloc pattern for state management.
//Added event handling for updating organization details upon selection.

class CreateAndManageOrganization extends StatelessWidget {
  const CreateAndManageOrganization({Key? key}) : super(key: key);

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
                  HeadingForEveryFormScreen(
                      text: "CREATE AND MANAGE ORGANIZATION"),
                  PopMenuButtonForUser(
                    text: 'SUPER ADMIN',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CreateAndManageOrganizationSearch(),
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
                    const CreateAndManageOrganizationOfTableHeading(),
                    SizedBox(
                      height: 500,
                      child: BlocConsumer<CreateAndManageOrganizationBloc,
                          CreateAndManageOrganizationState>(
                        bloc: context.read<CreateAndManageOrganizationBloc>(),
                        listener: (context, state) {},
                        builder: (context, state) {
                          return ListView(
                            children: [
                              ...listOfNUmbers.map((e) => GestureDetector(
                                    onTap: () {
                                      context
                                          .read<
                                              CreateAndManageOrganizationBloc>()
                                          .add(
                                              CreateAndManageOrganizationUpdateEvent(
                                                  value: listOfNUmbers
                                                      .indexOf(e)));
                                    },
                                    child: CreateAndManageOrganizationRow(
                                      organizationName: '${e.toString()} sky',
                                      organizationPrimaryAdminEmail:
                                          'admin@gmail.com',
                                      isSelected: listOfNUmbers.indexOf(e) ==
                                          state.selectedRow,
                                      organizationType: 'None',
                                      organizationId: '1234567',
                                    ),
                                  ))
                            ],
                          );
                        },
                      ),
                    )
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
