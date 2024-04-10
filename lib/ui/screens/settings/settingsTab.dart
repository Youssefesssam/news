import 'package:flutter/material.dart';
import 'package:news/ui/widets/app_loclization.dart';
import 'package:provider/provider.dart';

import '../../../data/providerLanguage/providerLanguage.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  static const String routeName = "settingTab";

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = "en";

  Widget build(BuildContext context) {
    ProviderLanguage providerLanguage = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(context.l10n(context).language,
              style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: "en",
                  child: Text("english"),
                ),
                DropdownMenuItem(
                  value: "ar",
                  child: Text("عربي"),
                ),
              ],
              value: selectedLanguage,
              style: const TextStyle(color: Colors.black, fontSize: 20),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              iconSize: 20,
              onChanged: (newValue) {
                selectedLanguage = newValue!;
                providerLanguage.setCurrentLocal(selectedLanguage);
                setState(() {});
              }),
        ],
      ),
    );
  }
}
