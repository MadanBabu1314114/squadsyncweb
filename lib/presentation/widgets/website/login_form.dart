import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/login_bloc/login_event.dart';
import 'package:squadsyncweb/presentation/widgets/website/submit_for_login.dart';
import 'package:squadsyncweb/presentation/widgets/website/text_field_for_login_screen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.submit, required this.isOrg})
      : super(key: key);
  final bool isOrg;
  final Function(String userName, String password) submit;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/EYE-NEW-SEE -MDF 3.png'))),
          ),
          const SizedBox(
            height: 10,
          ),
          RepaintBoundary(
            child: GradientText("SQUAD",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    letterSpacing: 4,
                    shadows: [
                      const Shadow(
                          color: Color.fromARGB(66, 241, 232, 184),
                          blurRadius: 25)
                    ]),
                colors: const [
                  Color(0xFF69FFFF),
                  Color(0xFF2681C7),
                ]),
          ),
          RepaintBoundary(
            child: GradientText(
              "SYNC",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                  letterSpacing: 4,
                  shadows: [
                    const Shadow(color: Color(0xFFF1E8B8), blurRadius: 25)
                  ]),
              colors: [
                0xFF6AF5ED,
                0xFF2D64AF,
                0xFF6DCFEE,
                0xFF2D64AF,
                0xFF6AF5ED,
              ].map((e) => Color(e)).toList(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldForLoginScreen(
              controller: userNameController, labelText: 'UserName'),
          const SizedBox(
            height: 20,
          ),
          TextFieldForLoginScreen(
            controller: passwordController,
            labelText: "Password",
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.transparent)),
              onPressed: () {
                context.read<LoginBloc>().add(LoginButtonPressed(context,
                    username: userNameController.text,
                    password: passwordController.text,
                    isOrg: widget.isOrg));
              },
              child: const SubmitForLogin(labelText: "lOGIN")),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Forgot Password",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
