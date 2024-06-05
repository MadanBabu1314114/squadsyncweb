import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:squadsyncweb/common/data_of_add_users.dart';
import 'package:squadsyncweb/presentation/bloc/add_users_bloc/add_users_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/add_users_bloc/add_users_event.dart';
import 'package:squadsyncweb/presentation/bloc/add_users_bloc/add_users_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/heading_for_every_form_screen.dart';
import 'package:squadsyncweb/presentation/widgets/common/pop_menu_button_for_user.dart';
import 'package:squadsyncweb/presentation/widgets/website/add_users/add_user_of_table_heading.dart';
import 'package:squadsyncweb/presentation/widgets/website/add_users/add_users_drag_drop_box.dart';
import 'package:squadsyncweb/presentation/widgets/website/add_users/add_users_of_table_row.dart';
import 'package:squadsyncweb/presentation/widgets/website/add_users/add_users_of_upload.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  late DropzoneViewController controller; // Initializing Dropzone controller
  bool isAthlete =
      false; // Flag to differentiate between athlete and staff uploads

  @override
  void initState() {
    listOfRows.clear(); // Clearing previous data on initialization
    successful = 0; // Reset successful uploads count
    failed = 0; // Reset failed uploads count
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DashBoardBackGround(
            screen: ListView(children: [
      const Padding(
        padding: EdgeInsets.all(20.0), // Padding for the top section
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Space between heading and user menu
          children: [
            HeadingForEveryFormScreen(text: "ADD USERS"), // Heading text
            PopMenuButtonForUser(
              text: 'ORGANISATION ADMIN', // Pop-up menu button text
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20, // Space below the heading
      ),
      BlocConsumer<AddUsersBloc, AddUsersState>(
        bloc: context.read<AddUsersBloc>(), // Reading the AddUsersBloc
        listener: (context, state) {}, // Listener for state changes
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center, // Center alignment for the stack
            children: [
              Column(
                children: [
                  if (listOfRows.length == 0) // If there are no rows of data
                    Column(
                      children: [
                        AddUsersDragDropBox(
                          heading:
                              "ATHLETE USERS", // Heading for athlete upload
                          description:
                              'ATHLETES', // Description for athlete upload
                          uploadEvent: (file) {
                            isAthlete = true; // Setting flag for athlete upload
                            context.read<AddUsersBloc>().add(
                                AddUsersUploadTheFileEvent(
                                    file: file,
                                    context:
                                        context)); // Upload event for athlete
                          },
                        ),
                        AddUsersDragDropBox(
                          heading: "STAFF USERS", // Heading for staff upload
                          description: 'STAFF', // Description for staff upload
                          uploadEvent: (file) {
                            isAthlete = false; // Setting flag for staff upload
                            context.read<AddUsersBloc>().add(
                                AddUsersUploadTheFileEvent(
                                    file: file,
                                    context:
                                        context)); // Upload event for staff
                          },
                        )
                      ],
                    ),
                  const SizedBox(
                    height:
                        10, // Space between drag drop boxes and next section
                  ),
                  if (state
                      is AddUsersUploadedState) // If file is uploaded successfully
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                20), // Padding for upload status container
                        child: Container(
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              color: const Color.fromARGB(61, 22, 22,
                                  22), // Background color for upload status
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                              ),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Aligning content to start
                                children: [
                                  Text('BULK UPLOAD STATUS',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                        color: const Color(
                                            0xFFFBA24F), // Upload status heading color
                                        shadows: [
                                          const BoxShadow(
                                              color: Color(
                                                  0xFFFBA24F), // Shadow color for heading
                                              blurRadius: 25,
                                              offset: Offset(0, 4))
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 20, // Space below the heading
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height:
                                            30, // Height for upload record container
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(127, 251, 138,
                                                  0), // Gradient start color
                                              Color.fromARGB(122, 149, 82,
                                                  0), // Gradient end color
                                            ])),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              5.0), // Padding inside the upload record container
                                          child: Text(
                                            'UPLOAD RECORD - ${successful.toString()}', // Displaying successful upload count
                                            style: const TextStyle(
                                                color:
                                                    Colors.white), // Text color
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width:
                                            10, // Space between upload and failed record containers
                                      ),
                                      Container(
                                        height:
                                            30, // Height for failed record container
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(127, 251, 138,
                                                  0), // Gradient start color
                                              Color.fromARGB(122, 149, 82,
                                                  0), // Gradient end color
                                            ])),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              5.0), // Padding inside the failed record container
                                          child: Text(
                                            'FAILED RECORDS - ${failed.toString()}', // Displaying failed upload count
                                            style: const TextStyle(
                                                color:
                                                    Colors.white), // Text color
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height:
                                        10, // Space below the record containers
                                  )
                                ]))),
                  const SizedBox(
                    height: 20, // Space below the upload status
                  ),
                  if (listOfRows.length != 0) // If there are rows of data
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20), // Padding for data table container
                      child: Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(61, 22, 22,
                                22), // Background color for data table
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                          ),
                          child: Column(children: [
                            AddUserOfTableHeading(
                                listOfItems:
                                    listOfRows[0]), // Table heading with data
                            Container(
                              height: (listOfRows.length - 1) * 30 > 500
                                  ? 500
                                  : (listOfRows.length) *
                                      30, // Dynamic height based on row count
                              child: ListView(
                                children: [
                                  ...listOfRows.skip(1).map((e) {
                                    return AddUsersOfTableRow(
                                        listOfItems: e
                                            .toList()); // Mapping rows to table row widgets
                                  })
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20, // Space below the table
                            ),
                          ])),
                    ),
                  if (listOfRows.length != 0) // If there are rows of data
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal:
                              20), // Padding for upload and cancel buttons
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .end, // Aligning buttons to the end
                        children: [
                          AddUsersOfUpload(
                            text: 'UPLOAD',
                            icon: Icons.upload,
                            method: () async {
                              context.read<AddUsersBloc>().add(
                                  AddUsersStartTheRegisterationEvent(
                                      context: context,
                                      isAthlete: isAthlete)); // Upload event
                            },
                          ),
                          const SizedBox(
                            width:
                                20, // Space between upload and cancel buttons
                          ),
                          AddUsersOfUpload(
                            text: 'CANCEL',
                            icon: Icons.close,
                            method: () {
                              context
                                  .read<AddUsersBloc>()
                                  .add(AddUsersCancelEvent()); // Cancel event
                            },
                          )
                        ],
                      ),
                    )
                ],
              ),
              if (state
                  is AddUsersUploadingState) // If uploading is in progress
                const CircularProgressIndicator(
                  color: Colors.white, // Progress indicator color
                )
            ],
          );
        },
      )
    ])));
  }
}
