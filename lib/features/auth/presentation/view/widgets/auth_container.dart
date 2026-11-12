import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 35.h,
            bottom: 35.h,
            left: 36.w,
            right: 36.w,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.authContainerBG,
            borderRadius: BorderRadius.circular(48.r),
            border: Border.all(
              color: AppColors.withe.withValues(alpha: 0.2),
              width: 4.w,
            ),
          ),
          child: child,
        ),

        Positioned(
          top: -18.h,
          right: -18.w,
          child: Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: AppColors.iconContainerBG,
              borderRadius: BorderRadius.circular(32.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1A000000),
                  offset: Offset(0, 4.h),
                  blurRadius: 6.r,
                  spreadRadius: -4.r,
                ),
                BoxShadow(
                  color: const Color(0x1A000000),
                  offset: Offset(0, 10.h),
                  blurRadius: 15.r,
                  spreadRadius: -3.r,
                ),
              ],
            ),
            child: Image.asset(AppStrings.authIcon),
          ),
        ),
      ],
    );
  }
}
