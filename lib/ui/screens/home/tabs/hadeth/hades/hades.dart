import 'package:flutter/material.dart';

import '../../../../../../models/hades_details_args.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_style.dart';
import '../../../home.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth_details";

  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    HadethDetailsArgs hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethDetailsArgs;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.lightBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          appBar: islamiAppBar, body: buildHadethContent(hadeth.hadethContent)),
    );
  }

  Widget buildHadethContent(String content) => Center(
        child: Container(
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .8,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              child: Text(
                content,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: AppStyle.titlesTextStyleLight.copyWith(fontSize: 16),
              ),
            )),
      );
}
