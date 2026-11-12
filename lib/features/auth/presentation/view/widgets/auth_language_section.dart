
import 'package:akoun/core/utils/app_localization.dart';
import 'package:akoun/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_language_option.dart';

enum AppLanguage {
  khaliji,
  egyptian,
  fusha,
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
  AppLanguage? selectedLanguage = AppLanguage.khaliji;

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
            title: AppLocalization.registerDialectFusha,
            image: AppStrings.foshaIcon,
            isSelected: selectedLanguage == AppLanguage.fusha,
            onTap: () => _selectLanguage(AppLanguage.fusha),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AuthLanguageOption(
            title: AppLocalization.registerDialectEgyptian,
            image: AppStrings.masryIcon,
            isSelected: selectedLanguage == AppLanguage.egyptian,
            onTap: () => _selectLanguage(AppLanguage.egyptian),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AuthLanguageOption(
            title: AppLocalization.registerDialectGulf,
            image: AppStrings.khalegyIcon,
            isSelected: selectedLanguage == AppLanguage.khaliji,
            onTap: () => _selectLanguage(AppLanguage.khaliji),
          ),
        ),
      ],
    );
  }
}
