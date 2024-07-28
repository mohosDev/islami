import 'package:flutter/material.dart';
import 'package:project/ui/screens/home/tabs/hadeth/ahadeth.dart';
import 'package:project/ui/screens/home/tabs/quran/quran.dart';
import 'package:project/ui/screens/home/tabs/radio/radio.dart';
import 'package:project/ui/screens/home/tabs/sebha/sebha.dart';
import 'package:project/ui/screens/home/tabs/setting/settings.dart';
import 'package:project/ui/utils/app_assets.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String routeHome = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navBarIndex = 0;
  List<Widget> internalWidgets = [
    const Quran(),
    Ahadeth(),
    const Sebha(),
    const RadioIslami(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.lightBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: islamiAppBar,
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
          selectedItemColor: Colors.white,
          backgroundColor: AppColors.primaryLight,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.icQuran),
                size: 40,
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.icAhadeth),
                size: 40,
              ),
              label: 'Hades',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.icSebha),
                size: 40,
              ),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.icRadio),
                size: 40,
              ),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 33,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

AppBar get islamiAppBar => AppBar(
      title: const Text(
        "Islami",
        style: AppStyle.appBarStyleLight,
      ),
    );
