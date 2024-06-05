import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/common/data.dart';
import 'package:squadsyncweb/data/data_source/retrieveing_org_list.dart';
import 'package:squadsyncweb/data/model/address.dart';
import 'package:squadsyncweb/data/model/organization.dart';
import 'package:squadsyncweb/presentation/bloc/create_organization_bloc/create_organization_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_organization_bloc/create_organization_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_organization_bloc/create_organization_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/background_for_forms.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart';
import 'package:squadsyncweb/presentation/widgets/common/submit_button.dart';
import 'package:squadsyncweb/presentation/widgets/website/button_for_date.dart';
import 'package:squadsyncweb/presentation/widgets/website/drop_down_button_for_selecting_elements.dart';
import 'package:squadsyncweb/presentation/widgets/website/text_field_for_text.dart';

//feat: Implement UI for creating organizations

// This commit introduces the UI for creating organizations in the Flutter app. It includes text fields for entering organization name, affiliation ID, mobile number, organization sports, organization address, and organization type. Additionally, it provides a submit button to send a request for creating the organization.

// The UI is designed using Flutter's Material Design components and organized into a stateful widget. The widget uses a Bloc pattern for managing state, specifically the CreateOrganizationBloc for handling organization creation events and states.

// The submit button triggers an event to send a request for creating the organization, including the provided organization details and user authentication token.

// Overall, this commit lays the foundation for creating organizations within the app.

class Createorganization extends StatefulWidget {
  const Createorganization({Key? key}) : super(key: key);

  @override
  State<Createorganization> createState() => _CreateorganizationState();
}

class _CreateorganizationState extends State<Createorganization> {
  final organizationNameController = TextEditingController();
  // final foundingYearController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final organizationAddressController = TextEditingController();
  final organizationTypeController = TextEditingController();
  final organizationSports = TextEditingController();
  final affiliationId = TextEditingController();

  @override
  void dispose() {
    organizationNameController.dispose();
    mobileNumberController.dispose();
    organizationSports.dispose();
    affiliationId.dispose();
    // foundingYearController.dispose();

    organizationAddressController.dispose();
    organizationTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget sizedHeight = const SizedBox(
      height: 10,
    );
    return Scaffold(
      body: SingleScreenBackGround(
        screen: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<CreateOrganizationBloc, CreateOrganizationState>(
            bloc: context.read<CreateOrganizationBloc>(),
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("CREATING organization",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: Colors.white)),
                          const SizedBox(
                            height: 20,
                          ),
                          sizedHeight,
                          TextFieldForText(
                            controller: organizationNameController,
                            labelText: "organization NAME",
                          ),
                          // sizedHeight,
                          // ButtonForDate(
                          //   controller: foundingYearController,
                          //   labelText: "FOUNDING YEAR",
                          // ),

                          sizedHeight,
                          TextFieldForText(
                            controller: affiliationId,
                            labelText: "Affiliation ID",
                          ),

                          sizedHeight,
                          TextFieldForText(
                            controller: mobileNumberController,
                            labelText: "Mobile Number",
                          ),

                          sizedHeight,
                          TextFieldForText(
                            controller: organizationSports,
                            labelText: "Organization Sports",
                          ),

                          sizedHeight,
                          TextFieldForText(
                            controller: organizationAddressController,
                            labelText: "organization ADDRESS",
                          ),

                          sizedHeight,

                          TextFieldForText(
                            controller: organizationTypeController,
                            labelText: "Organization Type",
                          ),

                          sizedHeight,

                          // DropDownButtonForSelectingElements(
                          //     controller: organizationTypeController,
                          //     labelText: "organization TYPE",
                          //     listOfItems: const ['1', '2', '3', '4']),
                          sizedHeight,

                          InkWell(
                            onTap: () {
                              context.read<CreateOrganizationBloc>().add(
                                  CreateOrganizationSendRequestEvent(
                                      address: Address(
                                          longitude: 170.685358,
                                          latitude: 0.7,
                                          fullAddress:
                                              "0965 Miguel Rapids\nNew Markhaven, VI 73553",
                                          street: "9110 Simpson Mews Apt. 451",
                                          city: "Thomashaven",
                                          state: "Washington",
                                          country: "Micronesia",
                                          postalCode: "81882"),
                                      organization: Organization(
                                          legalName:
                                              organizationNameController.text,
                                          telephone:
                                              mobileNumberController.text,
                                          orgType:
                                              organizationTypeController.text,
                                          organizationSport:
                                              organizationSports.text,
                                          organizationDepartment:
                                              "incubate B2C interfaces",
                                          affiliationId:
                                              int.parse(affiliationId.text)),
                                      bearerToken: userTokenBox
                                          .getAt(userTokenBox.length - 1)!
                                          .accessToken,
                                      sports: "FootBall , Swimming",
                                      context: context));
                            },
                            child: const SubmitButton(
                              text: 'SUBMIT',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if (state is CreateOrganizationLoadingState)
                    const CircularProgressIndicator(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
