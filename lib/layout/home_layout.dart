import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/modules/login/login_view.dart';

import '../core/helpers.dart';
import '../modules/settings/settings_view.dart';
import '../modules/tasks_list/tasks_list_view.dart';
import 'widgets/add_task_bottom_sheet.dart';
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

  List<Widget> screens = [
    const TasksListView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    List<String> titles = [
      lang.to_do_list,
      lang.settings,
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          titles[selectedIndex],
        ),
        actions: [
          selectedIndex == 1
              ? IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut().then(
                      (value) {
                        context.pushReplacementNamed(
                          LoginView.routeName,
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.exit_to_app_sharp,
                  ),
                )
              : const SizedBox(),
        ],
        toolbarHeight: context.screenHeight * .10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyFloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            context: context,
            builder: (context) => AddTaskBottomSheet(),
          );
        },
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index,) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
