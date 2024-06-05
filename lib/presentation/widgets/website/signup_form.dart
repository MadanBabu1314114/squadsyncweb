import 'package:flutter/material.dart';

import 'package:squadsyncweb/presentation/widgets/website/textFieldForPasswords.dart';
import 'package:squadsyncweb/presentation/widgets/website/text_field_for_text.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key, required this.updateScreen}) : super(key: key);
  final Function() updateScreen;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final invitationcodeController = TextEditingController();
  final passwordController = TextEditingController();
  final setPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final selectRole = TextEditingController();
  final aiffIdController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final primaryController = TextEditingController();
  final secondaryController = TextEditingController();
  bool isShowPassword = true;
  TextEditingController selectedDate = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate.text = picked.toString().split(" ")[0];
      });
    }
  }

  @override
  void dispose() {
    setPasswordController.dispose();
    heightController.dispose();
    weightController.dispose();
    primaryController.dispose();
    secondaryController.dispose();
    confirmPasswordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    aiffIdController.dispose();
    numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    invitationcodeController.dispose();
    selectRole.dispose();
    selectedDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget sizedBoxHeight = const SizedBox(
      height: 10,
    );
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen / 3,
      decoration: BoxDecoration(
          color: Color.fromARGB(160, 255, 255, 255),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "SignUp",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                isExpanded: true,
                items: ['Athlete', 'Coach']
                    .map((e) => DropdownMenuItem(
                        value: e.toString(), child: Text(e.toString())))
                    .toList(),
                onChanged: (value) {},
              ),
              sizedBoxHeight,
              Text(
                "Add the passbook photo",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              sizedBoxHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                  )
                ],
              ),
              sizedBoxHeight,
              TextFieldForText(
                  controller: firstnameController, labelText: "FIRST NAME"),
              sizedBoxHeight,
              TextFieldForText(
                controller: lastnameController,
                labelText: 'LAST NAME',
              ),
              sizedBoxHeight,
              DropdownButton(
                isExpanded: true,
                items: ['MALE', 'FEMALE']
                    .map((e) => DropdownMenuItem(
                        value: e.toString(), child: Text(e.toString())))
                    .toList(),
                onChanged: (value) {},
              ),
              sizedBoxHeight,
              TextFieldForPasswords(
                controller: setPasswordController,
                labelText: 'SET PASSWORD',
                isShowPassword: isShowPassword,
                key: const ObjectKey('set'),
              ),
              sizedBoxHeight,
              TextFieldForPasswords(
                controller: confirmPasswordController,
                labelText: 'CONFIRM PASSWORD',
                isShowPassword: isShowPassword,
                key: const ObjectKey('confirm'),
              ),
              sizedBoxHeight,
              TextFieldForText(
                controller: heightController,
                labelText: 'HEIGHT',
              ),
              sizedBoxHeight,
              TextFieldForText(
                controller: weightController,
                labelText: 'WEIGHT',
              ),
              sizedBoxHeight,
              TextFieldForText(
                controller: aiffIdController,
                labelText: 'AIFF ID',
              ),
              sizedBoxHeight,
              TextFieldForText(
                controller: invitationcodeController,
                labelText: 'INVITATION CODE',
              ),
              sizedBoxHeight,
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {}, child: const Text("Sign"))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                      onPressed: () {}, child: const Text("Have a Account"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
