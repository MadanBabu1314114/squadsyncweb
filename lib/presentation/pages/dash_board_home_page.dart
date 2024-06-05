import 'package:flutter/cupertino.dart';


// feat: Implement DashboardHomePage widget

// This commit adds the DashBoardHomePage widget, which is a StatelessWidget representing the home page of the dashboard in the Flutter app. The widget simply displays the text "Madan" at the center of the screen within a Container.

// This widget serves as the initial view of the dashboard and provides a basic structure for further development of the dashboard's UI and functionality.

class DashBoardHomePage extends StatelessWidget {
  const DashBoardHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Center(child: Text("Madan"),),
    );
  }
}
