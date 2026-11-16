import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/l10n_extension.dart';
import '../../../../../core/utils/validation.dart';
import 'auth_text_form_field.dart';

class ParentsSection extends StatelessWidget {
  final double borderRadius;
  final FormFieldSetter<String>? onEmailSaved;
  final FormFieldSetter<String>? onPhoneSaved;
  final FormFieldSetter<String>? onPasswordSaved;

  const ParentsSection({
    super.key,
    this.borderRadius = 48,
    this.onEmailSaved,
    this.onPhoneSaved,
    this.onPasswordSaved,
  });

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
                context.l10n.loginParentsSectionTitle,
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
          onSaved: onEmailSaved,
          borderRadius: borderRadius.r,
          prefixIcon: AppStrings.emailIcon,
          hint: context.l10n.loginEmailHint,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        AuthTextFormField(
          validator: (value) => Validation.validatePhone(value!),
          onSaved: onPhoneSaved,
          borderRadius: borderRadius.r,
          prefixIcon: AppStrings.phoneIcon,
          hint: context.l10n.loginPhoneHint,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 16.h),
        AuthTextFormField(
          validator: (value) => Validation.validatePassword(value!),
          onSaved: onPasswordSaved,
          borderRadius: borderRadius.r,
          prefixIcon: AppStrings.nameIcon,
          hint: 'كلمة المرور',
          obscureText: true,
        ),
      ],
    );
  }
}
