import 'package:flutter/material.dart';
import 'package:project/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../models/hades_details_args.dart';
import '../../../../../utils/app_assets.dart';
import '../../../home.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth_details";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadethDetailsArgs hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethDetailsArgs;
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
          appBar: islamiAppBar(context),
          body: buildHadethContent(hadeth.hadethContent),
        ),
      ),
    );
  }

  Widget buildHadethContent(String content) => Center(
        child: Container(
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .8,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: SingleChildScrollView(
              child: Text(
                content,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )),
      );
}
