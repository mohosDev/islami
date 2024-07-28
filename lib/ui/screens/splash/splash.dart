import 'package:flutter/material.dart';
import 'package:project/ui/utils/app_assets.dart';

class Splash extends StatelessWidget {
  Splash({super.key});
  static String routeSplash = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: AssetImage(AppAssets.splash),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
