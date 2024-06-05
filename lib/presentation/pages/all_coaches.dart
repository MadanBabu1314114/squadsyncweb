import 'package:flutter/material.dart'; // Importing necessary Flutter material package for UI components
import 'package:flutter_bloc/flutter_bloc.dart'; // Importing the flutter_bloc package for state management
import 'package:squadsyncweb/presentation/bloc/all_coaches_bloc/all_coaches_bloc.dart'; // Importing the Bloc class for All Coaches
import 'package:squadsyncweb/presentation/bloc/all_coaches_bloc/all_coaches_event.dart'; // Importing events for the All Coaches Bloc
import 'package:squadsyncweb/presentation/bloc/all_coaches_bloc/all_coaches_state.dart'; // Importing states for the All Coaches Bloc
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart'; // Importing a common widget for dashboard background
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart'; // Importing a common widget for headings
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart'; // Importing a common widget for the pop-up menu button
import 'package:squadsyncweb/presentation/widgets/common/view_super_admin_data.dart'; // Importing a common widget for viewing super admin data
import 'package:squadsyncweb/presentation/widgets/website/all_coaches_widgets/all_coaches_of_table_heading.dart'; // Importing widget for the coaches table heading
import 'package:squadsyncweb/presentation/widgets/website/all_coaches_widgets/all_coaches_row.dart'; // Importing widget for a row in the coaches table
import 'package:squadsyncweb/presentation/widgets/website/all_coaches_widgets/all_coaches_search.dart'; // Importing widget for the coaches search

// Added the AllCoaches widget.
// Included functionality for displaying a list of coaches.
// Implemented state management with BlocConsumer.
// Added UI elements for searching and displaying coach details.

class AllCoaches extends StatelessWidget {
  const AllCoaches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DashBoardBackGround(
            screen: ListView(children: [
      const Padding(
        padding: EdgeInsets.all(
            20.0), // Padding around the heading and pop-up menu button
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between heading and pop-up menu button
          children: [
            HeadingForEveryFormScreen(
                text: "ALL COACHES"), // Heading for the screen
            PopMenuButtonForUser(
              text: 'SUPER ADMIN', // Pop-up menu button text
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20, // Space below the heading section
      ),
      const AllCoachesSearch(), // Search widget for coaches
      const SizedBox(
        height: 10, // Space below the search widget
      ),
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20), // Padding around the table container
          child: Container(
              width: double.infinity, // Full width container
              decoration: ShapeDecoration(
                color: const Color.fromARGB(
                    61, 22, 22, 22), // Background color for the table container
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Rounded corners for the container
                ),
              ),
              child: Column(children: [
                const AllCoachesOfTableHeading(), // Table heading widget
                SizedBox(
                  height: 500, // Fixed height for the table container
                  child: BlocConsumer<AllCoachesBloc, AllCoachesState>(
                    bloc: context
                        .read<AllCoachesBloc>(), // Reading the AllCoachesBloc
                    listener: (context, state) {}, // Listener for state changes
                    builder: (context, state) {
                      return ListView(
                        children: [
                          ...listOfNUmbers.map((e) => GestureDetector(
                                onTap: () {
                                  context.read<AllCoachesBloc>().add(
                                      AllCoachesUpdateEvent(
                                          value: listOfNUmbers.indexOf(
                                              e))); // Event to update the selected row
                                },
                                child: AllCoachesRow(
                                  isSelected: listOfNUmbers.indexOf(e) ==
                                      state
                                          .selectedRow, // Check if the current row is selected
                                  firstName: 'Madan', // Placeholder first name
                                  lastName:
                                      'Gaddiparthi', // Placeholder last name
                                  organizatioName:
                                      'Sky', // Placeholder organization name
                                  coachId: '123456', // Placeholder coach ID
                                  coachPrimaryEmail:
                                      'admin@gmail.com', // Placeholder email
                                ),
                              ))
                        ],
                      );
                    },
                  ),
                )
              ])))
    ])));
  }
}
