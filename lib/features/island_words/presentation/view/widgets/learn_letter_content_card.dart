import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'learn_letter_speaker_button.dart';

/// Content card displaying the word illustration (e.g. Duck),
/// vertical divider, phonics-highlighted Arabic word, and interactive speaker button.
class LearnLetterContentCard extends StatelessWidget {
  final String imagePath;
  final String highlightedLetter;
  final String remainingWord;
  final VoidCallback? onSpeakerTap;
  final double? height;

  const LearnLetterContentCard({
    super.key,
    this.imagePath = 'assets/images/learn_letter_duck.png',
    this.highlightedLetter = 'بَ',
    this.remainingWord = 'طَّةَ',
    this.onSpeakerTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 295.h,
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
      child: Stack(
        children: [
          // 1. Speaker button at Top-Left
          Positioned(
            top: 14.h,
            left: 14.w,
            child: LearnLetterSpeakerButton(
              size: 46.w,
              onTap: onSpeakerTap,
            ),
          ),

          // 2. Main content (Duck illustration | Divider | Arabic Word)
          // Positioned in the lower portion of the card below the top overlap
          Positioned(
            left: 0,
            right: 0,
            bottom: 24.h,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  // Left Side: Illustration Image (Duck)
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        imagePath,
                        height: 125.h,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.pets_rounded,
                            size: 64.sp,
                            color: AppColors.islandWordsText.withValues(alpha: 0.5),
                          );
                        },
                      ),
                    ),
                  ),

                  // Center: Vertical Divider Line
                  Container(
                    width: 1.5.w,
                    height: 140.h,
                    color: AppColors.learnLetterDivider,
                  ),

                  // Right Side: Word with highlighted letter (بَـطَّةَ)
                  Expanded(
                    child: Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: highlightedLetter,
                                style: AppTextStyles.learnLetterWordHighlight,
                              ),
                              TextSpan(
                                text: remainingWord,
                                style: AppTextStyles.learnLetterWord,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
