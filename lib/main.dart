import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/ui/providers/language_provider.dart';
import 'package:project/ui/providers/theme_provider.dart';
import 'package:project/ui/screens/home/home.dart';
import 'package:project/ui/screens/home/tabs/hadeth/hades/hades.dart';
import 'package:project/ui/screens/home/tabs/quran/sura/sura.dart';
import 'package:project/ui/screens/splash/splash.dart';
import 'package:project/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LanguageProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      )
    ],
    child: Islami(),
  ));
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.appThemeLight,
      darkTheme: AppTheme.appThemeDark,
      themeMode: themeProvider.currentTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(languageProvider.locale),
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        Splash.routeSplash: (context) => Splash(),
        Home.routeHome: (context) => Home(),
        SuraDetails.routeSuraDetails: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      initialRoute: Splash.routeSplash,
    );
  }
}
