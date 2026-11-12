import 'package:akoun/core/common_widgets/app_3d_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_localization.dart';
import '../../../../core/utils/app_strings.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 472.h,
            left: 39.w,
            right: 38.w,
            child: Center(
              child: Text(
                AppLocalization.splashBodyTxt,
                style: AppTextStyles.splashBody,
              ),
            ),
          ),
          Positioned(
            left: 24.w,
            bottom: 65.h,
            child: App3DButton(
              title: AppLocalization.splashBtnTxt,
              icon: AppStrings.splashIcon,
              onPressed: () {
                context.go(AppRouter.chooseView);
              },
            ),
          ),
        ],
      ),
    );
  }
}
