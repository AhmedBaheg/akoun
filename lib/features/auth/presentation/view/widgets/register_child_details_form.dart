import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:akoun/core/utils/app_localization.dart';
import 'package:akoun/core/utils/app_strings.dart';
import 'package:akoun/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_gender_section.dart';
import 'auth_text_form_field.dart';

class RegisterChildDetailsForm extends StatelessWidget {
  const RegisterChildDetailsForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 11.w),
          child: Text(
            AppLocalization.registerChildNameTitle,
            style: AppTextStyles.authFieldLabel,
          ),
        ),

        SizedBox(height: 8.h),
        AuthTextFormField(
          validator: (value) => Validation.validateName(value!),
          borderRadius: 16.r,
          suffixIcon: AppStrings.personIcon,
          hint: AppLocalization.registerHeroNameHint,
        ),

        SizedBox(height: 23.h),
        Padding(
          padding: EdgeInsets.only(right: 11.w),
          child: Text(
            AppLocalization.registerAgeTitle,
            style: AppTextStyles.authFieldLabel,
          ),
        ),

        SizedBox(height: 8.h),
        AuthTextFormField(
          validator: (value) => Validation.validateName(value!),
          borderRadius: 16.r,
          suffixIcon: AppStrings.ageIcon,
          hint: AppLocalization.registerAgeHint,
        ),

        SizedBox(height: 23.h),
        Padding(
          padding: EdgeInsets.only(right: 11.w),
          child: Text(
            AppLocalization.registerGenderTitle,
            style: AppTextStyles.registerGenderLabel,
          ),
        ),

        SizedBox(height: 8.h),
        AuthGenderSection(),
      ],
    );
  }
}
