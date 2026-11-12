import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_localization.dart';

class AuthTextHeader extends StatelessWidget {
  const AuthTextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 183.h),
        Text(AppLocalization.loginHeader, style: AppTextStyles.loginHeader),
        SizedBox(height: 12.h),
        Text(
          AppLocalization.loginSubHeader,
          style: AppTextStyles.loginSubHeader,
        ),
      ],
    );
  }
}
