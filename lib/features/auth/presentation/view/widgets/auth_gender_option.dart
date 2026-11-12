import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'auth_gender_section.dart';

class AuthGenderOption extends StatelessWidget {
  final Gender gender;
  final String title;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  const AuthGenderOption({
    super.key,
    required this.gender,
    required this.title,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.withe,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? AppColors.selectedBorder
                : AppColors.borders,
            width: 2.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(emoji),
            SizedBox(width: 8.w),
            Text(
              title,
              style: AppTextStyles.registerGenderLabel,
            ),
          ],
        ),
      ),
    );
  }
}
