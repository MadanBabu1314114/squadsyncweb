import 'package:flutter/material.dart';

class DashBoardSideBarItem {
  final String text;
  final IconData icon;

  DashBoardSideBarItem({required this.text, required this.icon});
}

List<DashBoardSideBarItem> listOfDashBoardItem = [
  DashBoardSideBarItem(text: "HOME DASHBOARD", icon: Icons.home),
  DashBoardSideBarItem(text: "VIEW SUPER ADMIN", icon: Icons.person),
  DashBoardSideBarItem(text: "VIEW ORGANIZATION ADMIN", icon: Icons.factory_sharp),
  DashBoardSideBarItem(
      text: "CREATE AND MANAGE ORGANIZATION", icon: Icons.speaker_group_sharp),
  DashBoardSideBarItem(
      text: "CREATE AND MANAGE ORGANIZATION ADMINs",
      icon: Icons.co_present_rounded),
      DashBoardSideBarItem(text: "ADD USERS", icon: Icons.supervised_user_circle_rounded),
  DashBoardSideBarItem(text: "ALL ATHLETES", icon: Icons.sports_handball),
  DashBoardSideBarItem(text: "ALL COACHES", icon: Icons.sports),
  DashBoardSideBarItem(text: "ALL STAFF", icon: Icons.groups_2),
];
