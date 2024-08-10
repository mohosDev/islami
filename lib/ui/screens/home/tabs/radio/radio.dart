import 'package:flutter/material.dart';
import 'package:project/ui/utils/app_assets.dart';

class RadioIslami extends StatelessWidget {
  const RadioIslami({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(AppAssets.radioTabLogo),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Holy Quran Radio',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
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
