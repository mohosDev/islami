import 'package:flutter/material.dart';
import 'package:project/ui/screens/home/home.dart';
import 'package:project/ui/screens/home/tabs/hadeth/hades/hades.dart';
import 'package:project/ui/screens/home/tabs/quran/sura/sura.dart';
import 'package:project/ui/screens/splash/splash.dart';
import 'package:project/ui/utils/app_theme.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appThemeLight,
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        Splash.routeSplash: (context) => Splash(),
        Home.routeHome: (context) => const Home(),
        SuraDetails.routeSuraDetails: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      initialRoute: Home.routeHome,
    );
  }
}
