import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/l10n_extension.dart';

class AuthTextHeader extends StatelessWidget {
  const AuthTextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 183.h),
        Text(context.l10n.loginHeader, style: AppTextStyles.loginHeader),
        SizedBox(height: 12.h),
        Text(
          context.l10n.loginSubHeader,
          style: AppTextStyles.loginSubHeader,
        ),
      ],
    );
  }
}
