import 'package:akoun/core/router/app_router.dart';
import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/core/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_strings.dart';
import 'widgets/choose_action_button.dart';

class ChooseView extends StatelessWidget {
  const ChooseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chooseBG,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            width: 379.w,
            height: 379.h,
            bottom: -6.h,
            left: 6.w,
            child: Image.asset(AppStrings.choosePerson, fit: BoxFit.contain),
          ),

          // Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChooseActionButton(
                  onPressed: () {
                    context.push(AppRouter.registerView);
                  },
                  text: AppLocalization.chooseSignUp,
                  color: AppColors.chooseBtnRegisterBG,
                ),
                SizedBox(height: 21.h),
                ChooseActionButton(
                  onPressed: () {
                    context.push(AppRouter.loginView);
                  },
                  text: AppLocalization.chooseSignIn,
                  color: AppColors.chooseBtnLoginBG,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
