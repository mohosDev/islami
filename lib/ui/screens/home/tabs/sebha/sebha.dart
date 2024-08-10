import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/ui/providers/language_provider.dart';
import 'package:project/ui/providers/theme_provider.dart';
import 'package:project/ui/utils/sebha_name.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Consumer<ThemeProvider>(
                builder: (context, model, child) => Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: Transform.rotate(
                      angle: counter.toDouble() * 0.2,
                      child: Image(
                        image: AssetImage(model.isDarkThemeEnabled
                            ? AppAssets.sebhaTabLogoDark
                            : AppAssets.sebhaTabLogoLight),
                      ),
                    ),
                  ),
                ),
              ),
              Consumer<ThemeProvider>(
                builder: (context, model, child) => Container(
                  padding: const EdgeInsets.only(left: 40),
                  child: Center(
                    child: Image(
                      image: AssetImage(model.isDarkThemeEnabled
                          ? AppAssets.headsebhaTabLogoDark
                          : AppAssets.headsebhaTabLogoLight),
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            AppLocalizations.of(context)!.sebhaCount,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "$counter",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Consumer<LanguageProvider>(
            builder: (context, model, child) => ElevatedButton(
              onPressed: () {
                if (counter >= 32 && index < 2) {
                  setState(() {
                    counter = 0;
                    index++;
                  });
                } else if (counter >= 32 && index >= 2) {
                  setState(() {
                    counter = 0;
                    index = 0;
                  });
                } else {
                  setState(() {
                    counter++;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  backgroundColor: Theme.of(context).colorScheme.primary),
              child: Builder(builder: (context) {
                if (model.locale == 'en') {
                  return Text(
                    SebhaName.sebhaNameEn[index],
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                } else {
                  return Text(
                    SebhaName.sebhaNameAr[index],
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
