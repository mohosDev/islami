import 'package:flutter/material.dart';
import 'package:project/ui/utils/app_colors.dart';
import 'package:project/ui/utils/app_style.dart';
import 'package:project/ui/utils/sebha_name.dart';

import '../../../../utils/app_assets.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  String buttonContent = 'سبحان الله';
  int counter = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Transform.rotate(
                    angle: counter.toDouble() * 0.2,
                    child: Image(
                      image: AssetImage(
                        AppAssets.sebhaTabLogo,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      AppAssets.headsebhaTabLogo,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            'عدد التسبيحات',
            style: AppStyle.titlesTextStyleLight,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryLight),
            child: Text(
              "$counter",
              style: AppStyle.titlesTextStyleLight,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              if (counter >= 32 && index < 2) {
                setState(() {
                  counter = 0;
                  index++;
                  print(index);
                });
              } else if (counter >= 32 && index >= 2) {
                setState(() {
                  counter = 0;
                  index = 0;
                  print(index);
                });
              } else {
                setState(() {
                  counter++;
                });
              }
            },
            child: Text(
              "${SebhaName.sebhaName[index]}",
              style: AppStyle.titlesTextStyleLight,
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              backgroundColor: AppColors.primaryLight,
            ),
          )
        ],
      ),
    );
  }
}
