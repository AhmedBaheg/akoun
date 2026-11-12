
import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class AuthTeacherTypeOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color titleColor;
  final bool isSelected;
  final VoidCallback onTap;

  const AuthTeacherTypeOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.titleColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        height: 112.h,
        padding: EdgeInsets.all(12.w),
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
            Flexible(
              flex: 5,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(width: 8.w),

            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      style: AppTextStyles.teacher.copyWith(
                        color: titleColor,
                      ),
                    ),
                  ),


                  Text(
                    subtitle,
                    style: AppTextStyles.subTeacher
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
