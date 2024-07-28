import 'package:flutter/material.dart';
import 'package:project/ui/utils/app_assets.dart';
import 'package:project/ui/utils/app_style.dart';

class RadioIslami extends StatelessWidget {
  const RadioIslami({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(AppAssets.radioTabLogo),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Holy Quran Radio',
            style: AppStyle.titlesTextStyleLight,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.navigate_before,
                size: 60,
              ),
              Icon(
                Icons.play_arrow_rounded,
                size: 60,
              ),
              Icon(
                Icons.navigate_next,
                size: 60,
              )
            ],
          )
        ],
      ),
    );
  }
}
