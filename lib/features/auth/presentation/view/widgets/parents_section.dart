import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_localization.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/validation.dart';
import 'auth_text_form_field.dart';

class ParentsSection extends StatelessWidget {
  const ParentsSection({
    super.key, this.borderRadius = 48,
  });

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 11.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppLocalization.loginParentsSectionTitle,
                style: AppTextStyles.loginSectionLabel,
              ),
              SizedBox(width: 8.w),
              Image.asset(AppStrings.parentsIcon),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        AuthTextFormField(
          validator: (value) => Validation.validateEmail(value!),
          borderRadius: borderRadius.r,
          prefixIcon: AppStrings.emailIcon,
          hint: AppLocalization.loginEmailHint,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        AuthTextFormField(
          validator: (value) => Validation.validatePhone(value!),
          borderRadius: borderRadius.r,
          prefixIcon: AppStrings.phoneIcon,
          hint: AppLocalization.loginPhoneHint,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
