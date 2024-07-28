import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/models/sura_details_args.dart';
import 'package:project/ui/utils/app_colors.dart';
import 'package:project/ui/utils/app_style.dart';

import '../../../../../utils/app_assets.dart';
import '../../../home.dart';

class SuraDetails extends StatefulWidget {
  static const String routeSuraDetails = "suradetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;
  String fileContent = "";
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      readFile();
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.lightBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: islamiAppBar,
        body: fileContent.isEmpty ? buildCenter() : buildContainer(),
      ),
    );
  }

  Center buildCenter() {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.primaryLight,
    ));
  }

  Center buildContainer() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                fileContent,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: AppStyle.titlesTextStyleLight.copyWith(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future readFile() async {
    fileContent =
        await rootBundle.loadString("assets/files/quran/ar/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += "(${i + 1})  ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}

// ايه هي الـ threads هي كل الشغل الي شغال parallel
// وكل واحده بتكون مسؤلة عن حاجه معينه زي مثلا دوسة الزرار او رسم ال UI وهكذا
// في الموبايل عندنا حاجه اسمها main ui threads وهي الي مسؤلة عن رسم ال ui ولو حصل فيها شغل مت

// اصلا dart هي لغة معموله عشان تبقي single thread مينفعش تكون multithread
// دارت عندها isolation يعني ايه ؟ بتاخد ال threads بتقسمها لـ isolations

// نفس فكرة الـ Threads لكن بنقول عليها isolations وكل iso بيكون مسؤل عن حاجه معينه
