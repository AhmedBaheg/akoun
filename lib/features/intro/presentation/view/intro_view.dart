import 'package:akoun/features/intro/presentation/view/widgets/intro_welcome_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_localization.dart';
import '../../../../core/utils/app_strings.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStrings.introBg),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            IntroWelcomeContent(isMale: true,),
            Positioned(
                top: 195.h,
                right: 51.w,
                child: Container(
                  width: 225.w,
                  height: 182.h,
                  padding: EdgeInsets.only(
                    left: 14.w,
                    right: 4.w,
                    top: 33.h,
                    bottom: 33.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    AppLocalization.introText,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.tajawal(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: 0,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
