import 'package:akoun/features/intro/presentation/view/widgets/intro_welcome_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/l10n_extension.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherType = GoRouterState.of(context).extra;
    final isMale = teacherType == null ||
        !teacherType.toString().toLowerCase().contains('female');

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
            IntroWelcomeContent(
              isMale: isMale,
            ),
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
                  context.l10n.introText,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.introText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
