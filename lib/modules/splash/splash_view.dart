import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/modules/login/login_view.dart';

import '../../business_logic/provider.dart';
import '../../core/helpers.dart';
import '../../layout/home_layout.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splashView';

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 2,
        ), () {
      context.pushReplacementNamed(
        FirebaseAuth.instance.currentUser != null
            ? HomeLayout.routeName
            : LoginView.routeName,
      );
    });
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    var provider = Provider.of<SettingsProvider>(
      context,
    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            provider.changeSplashScreen(),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
