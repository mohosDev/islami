import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/models/sura_details_args.dart';
import 'package:project/ui/screens/home/tabs/quran/sura/sura.dart';
import 'package:project/ui/utils/sura_names.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(
              AppAssets.quranTabLogo,
            )),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.primaryLight,
                    height: 3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.sura,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.verses,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    height: 3,
                    thickness: 3,
                    color: AppColors.primaryLight,
                  ),
                  Expanded(child: buildSurasList()),
                ],
              ),
              const VerticalDivider(
                thickness: 3,
                color: AppColors.primaryLight,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSurasList() => ListView.builder(
        itemCount: SuraName.suraNamesArabic.length,
        itemBuilder: (context, index) => Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SuraDetails.routeSuraDetails,
                  arguments: SuraDetailsArgs(
                    suraName: SuraName.suraNamesArabic[index],
                    fileName: "${index + 1}.txt",
                  ),
                );
              },
              child: Text(
                SuraName.suraNamesArabic[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )),
            Expanded(
                child: Text(
              SuraName.versesNumber[index].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ))
          ],
        ),
      );
}
