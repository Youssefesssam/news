import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationUtils on BuildContext{
  AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context)!;
}