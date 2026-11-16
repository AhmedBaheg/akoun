import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';


/// Top card displaying the active Arabic letter in a large, prominent font.
///
/// Features a rounded rectangle container with a yellow border matching the Figma design.
class LearnLetterTopCard extends StatelessWidget {
  final String letter;
  final double? width;
  final double? height;

  const LearnLetterTopCard({
    super.key,
    required this.letter,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 209.w,
      height: height ?? 169.h,
      decoration: BoxDecoration(
        color: AppColors.islandLetterCardBg,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.selectedBorder,
          width: 2.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          letter,
          textAlign: TextAlign.center,
          style: AppTextStyles.learnLetterLarge,
        ),
      ),
    );
  }
}
