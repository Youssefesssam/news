import 'package:flutter/material.dart';
import 'package:news/data/providerLanguage/providerLanguage.dart';
import 'package:news/ui/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/ui/screens/settings/settingsTab.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( ChangeNotifierProvider(
    create: (_) => ProviderLanguage(),
      child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ProviderLanguage providerLanguage = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(providerLanguage.current),
      routes:({
        HomeScreen.routeName:(_)=>const HomeScreen()
      }),//
      initialRoute: HomeScreen.routeName,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
