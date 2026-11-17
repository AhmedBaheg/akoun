import 'package:akoun/core/theme/app_text_styles.dart';
import 'package:akoun/core/utils/app_strings.dart';
import 'package:akoun/core/utils/l10n_extension.dart';
import 'package:akoun/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_gender_section.dart';
import 'auth_text_form_field.dart';

class RegisterChildDetailsForm extends StatelessWidget {
  final FormFieldSetter<String>? onNameSaved;
  final FormFieldSetter<String>? onAgeSaved;
  final FormFieldSetter<Gender>? onGenderSaved;
  final ValueChanged<Gender>? onGenderChanged;

  const RegisterChildDetailsForm({
    super.key,
    this.onNameSaved,
    this.onAgeSaved,
    this.onGenderSaved,
    this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 11.w),
          child: Text(
            context.l10n.registerChildNameTitle,
            style: AppTextStyles.authFieldLabel,
          ),
        ),

        SizedBox(height: 8.h),
        AuthTextFormField(
          validator: (value) => Validation.validateName(value!),
          onSaved: onNameSaved,
          borderRadius: 16.r,
          prefixIcon: AppStrings.personIcon,
          hint: context.l10n.registerHeroNameHint,
        ),

        SizedBox(height: 23.h),
        Padding(
          padding: EdgeInsets.only(right: 11.w),
          child: Text(
            context.l10n.registerAgeTitle,
            style: AppTextStyles.authFieldLabel,
          ),
        ),

        SizedBox(height: 8.h),
        AuthTextFormField(
          validator: (value) => Validation.validateName(value!),
          onSaved: onAgeSaved,
          borderRadius: 16.r,
          prefixIcon: AppStrings.ageIcon,
          hint: context.l10n.registerAgeHint,
        ),

        SizedBox(height: 23.h),
        Padding(
          padding: EdgeInsets.only(right: 11.w),
          child: Text(
            context.l10n.registerGenderTitle,
            style: AppTextStyles.registerGenderLabel,
          ),
        ),

        SizedBox(height: 8.h),
        AuthGenderSection(
          onSaved: onGenderSaved,
          onChanged: onGenderChanged,
        ),
      ],
    );
  }
}
