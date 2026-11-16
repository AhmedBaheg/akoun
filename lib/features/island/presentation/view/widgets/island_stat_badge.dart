import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class IslandStatBadge extends StatelessWidget {
  final String iconPath;
  final String value;
  final VoidCallback? onAddTap;

  const IslandStatBadge({
    super.key,
    required this.iconPath,
    required this.value,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.w,
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
        color: AppColors.islandPillBg,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: AppColors.islandPillBorder,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 18.w,
              height: 18.h,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: AppTextStyles.islandPillText,
              ),
            ),
            GestureDetector(
              onTap: onAddTap,
              behavior: HitTestBehavior.opaque,
              child: Text(
                '+',
                style: AppTextStyles.islandPillText.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
