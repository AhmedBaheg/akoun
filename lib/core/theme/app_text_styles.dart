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
  static final TextStyle loginFieldLabel = GoogleFonts.lexend(
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
}
