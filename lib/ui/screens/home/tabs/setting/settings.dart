import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/ui/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../providers/theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          buildLanguageDropdown(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              buildSwitchTheme(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLanguageDropdown() => Consumer<LanguageProvider>(
      builder: (context, model, child) => DropdownButton(
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: 'ar', child: Text("العربية")),
              DropdownMenuItem(value: 'en', child: Text("English")),
            ],
            onChanged: (value) {
              model.changeLocale(value);
              prefs.setString("language", value ?? model.locale);
            },
            value: model.locale,
          ));
  Widget buildSwitchTheme() => Consumer<ThemeProvider>(
        builder: (context, model, child) => Row(
          children: [
            Text(
              AppLocalizations.of(context)!.light,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 15),
            ),
            Switch(
                value: model.isDarkThemeEnabled,
                onChanged: (value) {
                  model.isDarkThemeEnabledCheck(value);
                  prefs.setBool("theme", value);
                }),
            Text(
              AppLocalizations.of(context)!.dark,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 15),
            ),
          ],
        ),
      );
}
