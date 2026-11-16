import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'learn_letter_content_card.dart';
import 'learn_letter_top_card.dart';

/// Composite widget assembling the overlapping letter card and the word content card.
///
/// Exactly mirrors the Figma layout where the top letter card sits above and overlaps
/// the upper section of the word illustration card.
class LearnLetterCardsStack extends StatelessWidget {
  final String letter;
  final String highlightedLetter;
  final String remainingWord;
  final String imagePath;
  final VoidCallback? onSpeakerTap;

  const LearnLetterCardsStack({
    super.key,
    required this.letter,
    required this.highlightedLetter,
    required this.remainingWord,
    required this.imagePath,
    this.onSpeakerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          // 1. Bottom Card (Content & Word Card)
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: LearnLetterContentCard(
              imagePath: imagePath,
              highlightedLetter: highlightedLetter,
              remainingWord: remainingWord,
              onSpeakerTap: onSpeakerTap,
              height: 295.h,
            ),
          ),

          // 2. Top Card (Large Letter 'ب')
          Positioned(
            top: 0,
            child: LearnLetterTopCard(
              letter: letter,
              width: 209.w,
              height: 169.h,
            ),
          ),
        ],
      ),
    );
  }
}
