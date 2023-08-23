import 'package:flutter/material.dart';
import 'package:todo_application/core/helpers.dart';

class MyBottomNavigationBar extends StatelessWidget {
  void Function(
    int,
  )? onTap;
  int selectedIndex;

  MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    // var lang = AppLocalizations.of(context);
    return BottomAppBar(
      height: context.screenHeight * .09,
      notchMargin: 8,
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
