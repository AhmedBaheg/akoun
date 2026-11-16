import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  /// Splash Screen
  static final TextStyle splashBody = GoogleFonts.tajawal(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    height: 1,
    letterSpacing: 0,
    color: AppColors.splashBody,
  );

  static final TextStyle splashButton = GoogleFonts.lexend(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.splashBody,
  );

  static final TextStyle chooseButton = GoogleFonts.lexend(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    color: AppColors.withe,
  );

  /// Login Screen
  // Login Header
  static final TextStyle loginHeader = GoogleFonts.tajawal(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.96,
    height: 1.44,
    color: AppColors.loginTxt,
  );

// Login Sub Header
  static final TextStyle loginSubHeader = GoogleFonts.manrope(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.6,
    color: AppColors.loginSubTxt,
  );

// Login Field Label
  static final TextStyle authFieldLabel = GoogleFonts.lexend(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
    color: AppColors.loginTxt,
  );

// Global Hint
  static final TextStyle hint = GoogleFonts.lexend(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.0,
    color: AppColors.hint,
  );

// Login Section Label
  static final TextStyle loginSectionLabel = GoogleFonts.lexend(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
    color: AppColors.loginParentsTxt,
  );

  /// Register Screen

  static final TextStyle registerGenderLabel = GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.5,
    color: AppColors.registerGenderTxt,
  );

  static final TextStyle waveData = GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.5,
    color: AppColors.waveData,
  );

  static final TextStyle subWaveData = GoogleFonts.tajawal(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
    color: AppColors.subWaveData,
  );

  static final TextStyle teacher = GoogleFonts.tajawal(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.56,
  );

  static final TextStyle subTeacher = GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
    color: AppColors.subWaveData,
  );

  static final TextStyle selectLanguageButton = GoogleFonts.lexend(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
  );

  static final TextStyle selectLanguageTitle = GoogleFonts.lexend(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
    color: AppColors.loginTxt,
  );

  static TextStyle languageText = GoogleFonts.lexend(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    height: 1.2,
    letterSpacing: 0,
    color: AppColors.loginParentsTxt,
  );

  /// Intro Screen
  static final TextStyle introText = GoogleFonts.tajawal(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.0,
    color: AppColors.introText,
  );

  static final TextStyle introButton = GoogleFonts.notoSansArabic(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.0,
    color: AppColors.withe,
  );

  /// Island Screen
  static final TextStyle islandGreeting = GoogleFonts.tajawal(
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    shadows: [
      Shadow(
        color: Colors.black.withValues(alpha: 0.35),
        offset: const Offset(0, 2),
        blurRadius: 4,
      ),
    ],
  );

  static final TextStyle islandSubtitle = GoogleFonts.tajawal(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white.withValues(alpha: 0.95),
    shadows: [
      Shadow(
        color: Colors.black.withValues(alpha: 0.35),
        offset: const Offset(0, 1),
        blurRadius: 3,
      ),
    ],
  );

  static final TextStyle islandPillText = GoogleFonts.lexend(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static final TextStyle islandCardTitle = GoogleFonts.notoSansArabic(
    fontSize: 16.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.islandTitle,
  );

  /// Island Words / Letters Screen
  static final TextStyle islandWordsTitle = GoogleFonts.tajawal(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.islandWordsText,
  );

  static final TextStyle islandLetter = GoogleFonts.tajawal(
    fontSize: 44.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.islandWordsText,
  );

  /// Primary App Button
  static final TextStyle primaryButton = GoogleFonts.tajawal(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.withe,
  );

  /// Learn Letter Screen
  static final TextStyle learnLetterTitle = GoogleFonts.tajawal(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.islandWordsText,
  );

  static final TextStyle learnLetterLarge = GoogleFonts.tajawal(
    fontSize: 100.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.islandWordsText,
    height: 1.1,
  );

  static final TextStyle learnLetterWord = GoogleFonts.tajawal(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static final TextStyle learnLetterWordHighlight = GoogleFonts.tajawal(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.learnLetterHighlighted,
  );

  /// Remember Screen ("تذكر")
  static final TextStyle rememberCardText = GoogleFonts.tajawal(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    height: 1.6,
    color: Colors.black,
  );

  /// Pronunciation Practice Screen ("تدريب النطق")
  static final TextStyle pronunciationSubtitle = GoogleFonts.tajawal(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.islandWordsText,
  );

  /// Listening Practice Screen ("تدريب الاستماع")
  static final TextStyle listeningSubtitle = GoogleFonts.tajawal(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF4B6082),
  );

  static final TextStyle listeningLetterOption = GoogleFonts.tajawal(
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.islandWordsText,
    height: 1.1,
  );

  static final TextStyle listeningLetterItem = listeningLetterOption;

  static final TextStyle listeningWrongMessage = GoogleFonts.tajawal(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.listeningWrongText,
  );

  static final TextStyle listeningCorrectTitle = GoogleFonts.tajawal(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.islandWordsText,
    height: 1.25,
  );
}
