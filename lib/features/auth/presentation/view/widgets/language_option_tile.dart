import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageOptionTile extends StatelessWidget {
  final String language;
  final bool isSelected;
  final VoidCallback? onTap;
  final double width;

  const LanguageOptionTile({
    super.key,
    required this.language,
    this.isSelected = false,
    this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52.h,
        width: width.w,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.unselectedColor,
          borderRadius: BorderRadius.circular(50.r),
          border: Border(
            bottom: BorderSide(color: AppColors.shadowColor, width: 6.h),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          language,
          style: AppTextStyles.selectLanguageButton.copyWith(
            color: isSelected ? Colors.white : AppColors.loginParentsTxt,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
