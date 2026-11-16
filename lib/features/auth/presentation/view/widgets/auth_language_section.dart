import 'package:akoun/core/utils/app_strings.dart';
import 'package:akoun/core/utils/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_language_option.dart';

enum AppLanguage {
  khaleeji,
  egyptian,
  fusha,
}

extension AppLanguageX on AppLanguage {
  String get value {
    switch (this) {
      case AppLanguage.khaleeji:
        return 'khaleeji';
      case AppLanguage.egyptian:
        return 'egyptian';
      case AppLanguage.fusha:
        return 'fusha';
    }
  }
}

class AuthLanguageSection extends StatefulWidget {
  final ValueChanged<AppLanguage>? onChanged;

  const AuthLanguageSection({
    super.key,
    this.onChanged,
  });

  @override
  State<AuthLanguageSection> createState() =>
      _AuthLanguageSectionState();
}

class _AuthLanguageSectionState extends State<AuthLanguageSection> {
  AppLanguage? selectedLanguage = AppLanguage.khaleeji;

  @override
  void initState() {
    super.initState();
    if (selectedLanguage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(selectedLanguage!);
      });
    }
  }

  void _selectLanguage(AppLanguage language) {
    setState(() {
      selectedLanguage = language;
    });

    widget.onChanged?.call(language);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthLanguageOption(
            title: context.l10n.registerDialectFusha,
            image: AppStrings.foshaIcon,
            isSelected: selectedLanguage == AppLanguage.fusha,
            onTap: () => _selectLanguage(AppLanguage.fusha),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AuthLanguageOption(
            title: context.l10n.registerDialectEgyptian,
            image: AppStrings.masryIcon,
            isSelected: selectedLanguage == AppLanguage.egyptian,
            onTap: () => _selectLanguage(AppLanguage.egyptian),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AuthLanguageOption(
            title: context.l10n.registerDialectGulf,
            image: AppStrings.khalegyIcon,
            isSelected: selectedLanguage == AppLanguage.khaleeji,
            onTap: () => _selectLanguage(AppLanguage.khaleeji),
          ),
        ),
      ],
    );
  }
}
