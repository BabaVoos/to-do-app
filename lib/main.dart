import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/modules/login/login_view.dart';
import 'package:todo_application/modules/signup/signup_view.dart';

import 'business_logic/provider.dart';
import 'core/themes.dart';
import 'layout/home_layout.dart';
import 'modules/edit_task/edit_task_view.dart';
import 'modules/settings/settings_view.dart';
import 'modules/splash/splash_view.dart';
import 'modules/tasks_list/tasks_list_view.dart';
import 'network_layer/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseFirestore.instance.disableNetwork();
  await CacheHelper.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(
        CacheHelper.getStringData(key: 'lang') ?? provider.defaultLanguage,
      ),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: provider.setThemeMode(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        SplashView.routeName: (context) => const SplashView(),
        TasksListView.routeName: (context) => const TasksListView(),
        SettingsView.routeName: (context) => const SettingsView(),
        EditTaskView.routeName: (context) => EditTaskView(),
        LoginView.routeName: (context) => LoginView(),
        SignupView.routeName: (context) => SignupView(),
      },
    );
  }
}
