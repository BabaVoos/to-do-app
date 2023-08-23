import 'package:flutter/material.dart';

import 'core/themes.dart';
import 'layout/home_layout.dart';
import 'modules/settings/settings_view.dart';
import 'modules/splash/splash_view.dart';
import 'modules/tasks_list/tasks_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        SplashView.routeName: (context) => const SplashView(),
        TasksListView.routeName: (context) => const TasksListView(),
        SettingsView.routeName: (context) => const SettingsView(),
      },
    );
  }
}
