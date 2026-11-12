import 'package:akoun/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'language_option_tile.dart';

class LanguageSelectionWidget extends StatelessWidget {
  const LanguageSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'اختر لغتك',
          style: GoogleFonts.tajawal(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColor,
            height: 1.3,
          ),
        ),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const LanguageOptionTile(
              language: 'English',
              width: 107,
            ),
            SizedBox(width: 20.w),
            const LanguageOptionTile(
              language: 'العربية',
              width: 89,
              isSelected: true,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const LanguageOptionTile(
              language: 'اردو',
              width: 72,
            ),
            SizedBox(width: 14.w),
            const LanguageOptionTile(
              language: 'Türkçe',
              width: 100,
            ),
          ],
        ),
      ],
    );
  }
}