import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_application/core/helpers.dart';

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
        HomeLayout.routeName,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/light_splash.png',
        ),
        fit: BoxFit.fill,
      )),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
