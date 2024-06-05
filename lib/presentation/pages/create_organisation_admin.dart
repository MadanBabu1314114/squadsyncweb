import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/common/data.dart';
import 'package:squadsyncweb/data/model/address.dart';
import 'package:squadsyncweb/data/model/education.dart';
import 'package:squadsyncweb/data/model/org_id.dart';
import 'package:squadsyncweb/data/model/person.dart';
import 'package:squadsyncweb/presentation/bloc/create_org_admin_bloc/create_org_admin_event.dart';
import 'package:squadsyncweb/presentation/bloc/create_org_admin_bloc/create_org_admin_state.dart';
import 'package:squadsyncweb/presentation/bloc/create_org_admin_bloc/create_organization_bloc.dart';
import 'package:squadsyncweb/presentation/widgets/common/single_screen_background.dart';
import 'package:squadsyncweb/presentation/widgets/common/submit_button.dart';
import 'package:squadsyncweb/presentation/widgets/website/drop_down_button_for_selecting_elements.dart';
import 'package:squadsyncweb/presentation/widgets/website/text_field_for_text.dart';

//Implemented functionality for creating an organization admin.
// Created UI components for entering admin details such as name, gender, contact, email, etc.
// Integrated dropdowns for selecting organization name and gender.
//Added event handling for submitting admin creation request.

class CreateORGANIZATIONAdmin extends StatefulWidget {
  const CreateORGANIZATIONAdmin({Key? key}) : super(key: key);

  @override
  State<CreateORGANIZATIONAdmin> createState() =>
      _CreateORGANIZATIONAdminState();
}

class _CreateORGANIZATIONAdminState extends State<CreateORGANIZATIONAdmin> {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();
  final birthDateController = TextEditingController();
  final contactController = TextEditingController();
  final emailIdController = TextEditingController();
  final nationalityController = TextEditingController();
  final organizationNameController = TextEditingController();

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        birthDateController.text =
            '${picked.year}-${picked.month}-${picked.day}';
      });
    }
  }

  @override
  void dispose() {
    genderController.dispose();
    organizationNameController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    contactController.dispose();
    emailIdController.dispose();
    nationalityController.dispose();

    super.dispose();
  }

  OrgId take() {
    for (OrgId org in listOfOrg) {
      if (org.orgIdName == organizationNameController.text) {
        return org;
      }
    }
    return OrgId(id: 0, orgIdName: '');
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CreateOrgAdminBloc>(context)
        .add(CreateOrgAdminRetrieveListOrgEvent());
    return Scaffold(
      body: SingleScreenBackGround(
        screen: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<CreateOrgAdminBloc, CreateOrgAdminState>(
            bloc: context.read<CreateOrgAdminBloc>(),
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
                          Text(
                            "CREATING ORGANIZATION ADMIN",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldForText(
                              controller: firstNameController,
                              labelText: "First Name"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldForText(
                              controller: middleNameController,
                              labelText: "Middle Name"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldForText(
                              controller: lastNameController,
                              labelText: "Last Name"),
                          const SizedBox(
                            height: 10,
                          ),
                          DropDownButtonForSelectingElements(
                            controller: genderController,
                            labelText: "Gender",
                            listOfItems: const [
                              "Male",
                              "Female",
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextFieldForText(
                                  controller: birthDateController,
                                  labelText: "Birth Date"),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                    onPressed: () {
                                      selectDate(context);
                                    },
                                    icon: const Icon(
                                      Icons.date_range,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldForText(
                              controller: contactController,
                              labelText: "Contact"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldForText(
                              controller: emailIdController,
                              labelText: "Email ID"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldForText(
                              controller: nationalityController,
                              labelText: "Nationality"),
                          const SizedBox(
                            height: 10,
                          ),
                          DropDownButtonForSelectingElements(
                              controller: organizationNameController,
                              labelText: 'Organization Name',
                              listOfItems:
                                  listOfOrg.map((e) => e.orgIdName).toList()),
                          InkWell(
                            onTap: () {
                              context.read<CreateOrgAdminBloc>().add(
                                  CreateOrgAdminSendRequestEvent(
                                      bearerToken: userTokenBox
                                          .getAt(userTokenBox.length - 1)!
                                          .accessToken,
                                      address: Address(
                                          longitude: -97.870542,
                                          latitude: -47.2347615,
                                          fullAddress:
                                              "571 Tiffany Isle\nKirkton, MS 28322",
                                          street: "76009 Green Lake",
                                          city: "Curtisville",
                                          state: "Curtisville",
                                          country: "Panama",
                                          postalCode: '84321'),
                                      context: context,
                                      education: Education(
                                          educationQualification:
                                              "Pension scheme manager",
                                          educationDegreeIn: "lose"),
                                      person: Person(
                                          firstName: firstNameController.text,
                                          middleName: middleNameController.text,
                                          lastName: lastNameController.text,
                                          gender: 'Male',
                                          birthDate: birthDateController.text,
                                          contact: contactController.text,
                                          emailId: emailIdController.text,
                                          nationality:
                                              nationalityController.text,
                                          isActive: 1,
                                          organizationId: take().id),
                                      personRole: 'Orgadmin'));
                            },
                            child: const SubmitButton(
                              text: 'SUBMIT',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  if (state is CreateOrgAdminLoadingState)
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
