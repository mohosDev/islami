import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/ui/providers/theme_provider.dart';
import 'package:project/ui/utils/app_assets.dart';
import 'package:provider/provider.dart';

import '../home/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static String routeSplash = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2500),
      () => Navigator.pushReplacementNamed(context, Home.routeHome),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ThemeProvider>(
      builder: (context, model, child) => Image(
        image: AssetImage(
            model.isDarkThemeEnabled ? AppAssets.splashDark : AppAssets.splash),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    ));
  }
}
