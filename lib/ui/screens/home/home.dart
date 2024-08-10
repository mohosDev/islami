import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/ui/providers/theme_provider.dart';
import 'package:project/ui/screens/home/tabs/hadeth/ahadeth.dart';
import 'package:project/ui/screens/home/tabs/quran/quran.dart';
import 'package:project/ui/screens/home/tabs/radio/radio.dart';
import 'package:project/ui/screens/home/tabs/sebha/sebha.dart';
import 'package:project/ui/screens/home/tabs/setting/settings.dart';
import 'package:project/ui/utils/app_assets.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class Home extends StatefulWidget {
  Home({super.key});
  static String routeHome = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ThemeProvider themeProvider;
  int navBarIndex = 0;
  List<Widget> internalWidgets = [
    const Quran(),
    Ahadeth(),
    const Sebha(),
    const RadioIslami(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Consumer<ThemeProvider>(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(model.isDarkThemeEnabled
                ? AppAssets.darkBackground
                : AppAssets.lightBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: islamiAppBar(context),
          body: Column(
            children: [
              Expanded(child: internalWidgets[navBarIndex]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (value) => (setState(() {
              navBarIndex = value;
            })),
            currentIndex: navBarIndex,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage(AppAssets.icQuran),
                  size: 40,
                ),
                label: AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage(AppAssets.icAhadeth),
                  size: 40,
                ),
                label: AppLocalizations.of(context)!.hadeths,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage(AppAssets.icSebha),
                  size: 40,
                ),
                label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage(AppAssets.icRadio),
                  size: 40,
                ),
                label: AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.settings,
                  size: 33,
                ),
                label: AppLocalizations.of(context)!.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar islamiAppBar(BuildContext context) => AppBar(
      title: Text(
        AppLocalizations.of(context)!.islami,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
