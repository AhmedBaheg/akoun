
import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLanguageOption extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const AuthLanguageOption({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 82.w,
        height: 124.9.h,
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF4CAF50)
              : Colors.white,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF087B27)
                : const Color(0xFFBDC8D1),
            width: 3.w,
          ),
          boxShadow: isSelected
              ? []
              : [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 4.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: AppTextStyles.languageText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
