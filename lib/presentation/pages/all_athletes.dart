import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/all_athletes_bloc/all_athletes_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/all_athletes_bloc/all_athletes_event.dart';
import 'package:squadsyncweb/presentation/bloc/all_athletes_bloc/all_athletes_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/common/view_super_admin_data.dart';
import 'package:squadsyncweb/presentation/widgets/website/all_athletes_widgets/all_athletes_of_table_heading.dart';
import 'package:squadsyncweb/presentation/widgets/website/all_athletes_widgets/all_athletes_row.dart';
import 'package:squadsyncweb/presentation/widgets/website/all_athletes_widgets/all_athletes_search.dart';

class AllAthletes extends StatelessWidget {
  const AllAthletes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DashBoardBackGround(
            screen: ListView(children: [
      const Padding(
        padding: EdgeInsets.all(20.0), // Padding for the heading section
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between heading and user menu
          children: [
            HeadingForEveryFormScreen(text: "ALL ATHLETES"), // Heading text
            PopMenuButtonForUser(
              text: 'SUPER ADMIN', // Pop-up menu button text
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20, // Space below the heading
      ),
      const AllAthletesSearch(), // Search widget for athletes
      const SizedBox(
        height: 10, // Space below the search box
      ),
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20), // Padding for the athletes table container
          child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(
                    61, 22, 22, 22), // Background color for the athletes table
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: Column(children: [
                const AllAthletesOfTableHeading(), // Table heading
                SizedBox(
                  height: 500, // Fixed height for the table container
                  child: BlocConsumer<AllAthletesBloc, AllAthletesState>(
                    bloc: context
                        .read<AllAthletesBloc>(), // Reading the AllAthletesBloc
                    listener: (context, state) {}, // Listener for state changes
                    builder: (context, state) {
                      return ListView(
                        children: [
                          ...listOfNUmbers.map((e) => GestureDetector(
                                onTap: () {
                                  context.read<AllAthletesBloc>().add(
                                      AllAthletesUpdateEvent(
                                          value: listOfNUmbers.indexOf(
                                              e))); // Update event for selecting a row
                                },
                                child: AllAthletesRow(
                                  isSelected: listOfNUmbers.indexOf(e) ==
                                      state
                                          .selectedRow, // Checking if the row is selected
                                  firstName: 'Madan', // Placeholder first name
                                  lastName:
                                      'Gaddiparthi', // Placeholder last name
                                  organizatioName:
                                      'Sky', // Placeholder organization name
                                  coachName: 'Madan', // Placeholder coach name
                                  athletesPrimaryEmail:
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
