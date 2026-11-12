import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_localization.dart';
import '../../../../../core/utils/app_strings.dart';

class IntroWelcomeContent extends StatelessWidget {
  const IntroWelcomeContent({super.key, required this.isMale});

  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isMale
            ? Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 275.w,
                  height: 398.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppStrings.introMale),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : Positioned(
                bottom: -27,
                left: 0,
                child: Transform.flip(
                  flipX: true,
                  child: Container(
                    width: 240.w,
                    height: 398.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppStrings.introFemale),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
        Positioned(
          bottom: 47,
          right: 24,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(129.w, 41.h),
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 0,
            ),
            onPressed: () {},
            child: Text(
              AppLocalization.introTextBtn,
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
