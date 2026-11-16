import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/core/utils/l10n_extension.dart';
import 'package:akoun/core/utils/locale_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'language_option_tile.dart';

class LanguageSelectionWidget extends StatefulWidget {
  final String? initialLanguage;
  final ValueChanged<String>? onChanged;

  const LanguageSelectionWidget({
    super.key,
    this.initialLanguage,
    this.onChanged,
  });

  @override
  State<LanguageSelectionWidget> createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.initialLanguage;
  }

  @override
  void didUpdateWidget(covariant LanguageSelectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialLanguage != widget.initialLanguage) {
      _selectedLanguage = widget.initialLanguage;
    }
  }

  void _selectLanguage(String languageCode, String languageName) {
    if (_selectedLanguage != languageName) {
      setState(() {
        _selectedLanguage = languageName;
      });

      // Synchronize locale when user chooses English or Arabic
      if (languageCode == 'en' || languageCode == 'ar') {
        LocaleManager.changeLanguage(languageCode);
      }

      widget.onChanged?.call(languageName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentSelected = _selectedLanguage ?? l10n.registerLanguageArabic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          l10n.registerLanguageTitle,
          style: GoogleFonts.tajawal(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColor,
            height: 1.3.h,
          ),
        ),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LanguageOptionTile(
              language: l10n.registerLanguageEnglish,
              width: 107.w,
              isSelected: currentSelected == l10n.registerLanguageEnglish,
              onTap: () =>
                  _selectLanguage('en', l10n.registerLanguageEnglish),
            ),
            SizedBox(width: 20.w),
            LanguageOptionTile(
              language: l10n.registerLanguageArabic,
              width: 89.w,
              isSelected: currentSelected == l10n.registerLanguageArabic,
              onTap: () =>
                  _selectLanguage('ar', l10n.registerLanguageArabic),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LanguageOptionTile(
              language: l10n.registerLanguageUrdu,
              width: 72.w,
              isSelected: currentSelected == l10n.registerLanguageUrdu,
              onTap: () =>
                  _selectLanguage('ur', l10n.registerLanguageUrdu),
            ),
            SizedBox(width: 14.w),
            LanguageOptionTile(
              language: l10n.registerLanguageTurkish,
              width: 100.w,
              isSelected: currentSelected == l10n.registerLanguageTurkish,
              onTap: () =>
                  _selectLanguage('tr', l10n.registerLanguageTurkish),
            ),
          ],
        ),
      ],
    );
  }
}
