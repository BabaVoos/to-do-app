import 'package:flutter/material.dart';
import 'package:todo_application/core/helpers.dart';

import '../modules/settings/settings_view.dart';
import '../modules/tasks_list/tasks_list_view.dart';
import 'widgets/my_bottom_navigation_bar.dart';
import 'widgets/my_floating_action_button.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'homeLayout';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  List<String> titles = [
    'To Do List',
    'Settings',
  ];

  List<Widget> screens = [
    const TasksListView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          titles[selectedIndex],
        ),
        toolbarHeight: context.screenHeight * .10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyFloatingActionButton(
        onPressed: () {},
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (
          index,
        ) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
