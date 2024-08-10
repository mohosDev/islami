import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../models/hades_details_args.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import 'hades/hades.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<HadethDetailsArgs> hadethList = [];

  @override
  void initState() {
    super.initState();
    readHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(
              AppAssets.ahadethTabLogo,
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
                          AppLocalizations.of(context)!.hadeth,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
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
                  Expanded(child: buildAhadethList()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future readHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString("assets/files/hades/ar/ahadeth.txt");
    List<String> ahadethAsStrings = ahadethFileContent.split("#\r\n");
    for (int i = 0; i < ahadethAsStrings.length; i++) {
      String hadeth = ahadethAsStrings[i];
      List<String> hadethLines = hadeth.split("\n");
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join();
      hadethList.add(HadethDetailsArgs(
          hadethName: hadethName.trim(), hadethContent: hadethContent));
    }
    setState(() {});
  }

  Widget buildAhadethList() => hadethList.isEmpty
      ? const CircularProgressIndicator()
      : ListView.builder(
          itemCount: hadethList.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: hadethList[index]);
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      hadethList[index].hadethName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                  ],
                ),
              ));
}
