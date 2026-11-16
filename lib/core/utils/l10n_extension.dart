import 'package:flutter/widgets.dart';
import '../../l10n/app_localizations.dart';

export '../../l10n/app_localizations.dart';

/// Extension on [BuildContext] for easy and clean access to generated [AppLocalizations].
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
