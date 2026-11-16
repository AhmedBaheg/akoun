import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

enum LetterCardStatus { completed, current, locked }

class LetterCardWidget extends StatelessWidget {
  final String letter;
  final LetterCardStatus status;
  final bool isSelected;
  final VoidCallback? onTap;

  const LetterCardWidget({
    super.key,
    required this.letter,
    this.status = LetterCardStatus.locked,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = status == LetterCardStatus.completed;
    final bool isCurrent = status == LetterCardStatus.current;

    Color backgroundColor;
    Border? border;

    if (isCompleted) {
      backgroundColor = AppColors.islandLetterActiveBg;
      border = isSelected
          ? Border.all(color: AppColors.withe, width: 2.5.w)
          : Border.all(color: AppColors.islandLetterActiveBorder, width: 1.w);
    } else if (isCurrent) {
      backgroundColor = AppColors.islandLetterCurrentBg;
      border = isSelected
          ? Border.all(color: AppColors.withe, width: 2.5.w)
          : Border.all(
              color: AppColors.islandWordsText.withValues(alpha: 0.6),
              width: 1.5.w,
            );
    } else {
      backgroundColor = AppColors.islandLetterCardBg;
      border = isSelected
          ? Border.all(color: AppColors.islandWordsText, width: 2.5.w)
          : null;
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.r),
          border: border,
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.islandWordsText.withValues(alpha: 0.25),
                blurRadius: 8,
                offset: const Offset(0, 3),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // شارة الإنجاز الخضراء (Checkmark) للمكتمل
            if (isCompleted)
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.islandLetterCheckmark,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 13.sp),
                ),
              ),

            // الحرف العربي في منتصف البطاقة
            Text(
              letter,
              textAlign: TextAlign.center,
              style: AppTextStyles.islandLetter.copyWith(
                color: status == LetterCardStatus.locked
                    ? AppColors.islandWordsText.withValues(alpha: 0.65)
                    : AppColors.islandWordsText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
