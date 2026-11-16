import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'learn_letter_speaker_button.dart';

/// Card widget for the "تذكر" screen that presents the letter's articulation explanation
/// with a speaker button centered and overlapping the bottom border.
class RememberLetterCard extends StatelessWidget {
  final String tipText;
  final VoidCallback? onSpeakerTap;

  const RememberLetterCard({
    super.key,
    required this.tipText,
    this.onSpeakerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // 1. The Main Articulation Card
          Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 280.h),
            padding: EdgeInsets.fromLTRB(24.w, 48.h, 24.w, 64.h),
            decoration: BoxDecoration(
              color: AppColors.islandLetterCardBg,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.selectedBorder, width: 2.w),
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
                tipText,
                textAlign: TextAlign.center,
                style: AppTextStyles.rememberCardText,
              ),
            ),
          ),

          // 2. Speaker Button Overlapping the Bottom Border
          Positioned(
            bottom: -27.w,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.selectedBorder, width: 2.w),
              ),
              child: LearnLetterSpeakerButton(size: 54.w, onTap: onSpeakerTap),
            ),
          ),
        ],
      ),
    );
  }
}
