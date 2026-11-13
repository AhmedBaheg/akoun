
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_localization.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/validation.dart';
import 'auth_gender_option.dart';

enum Gender { male, female }

class AuthGenderSection extends FormField<Gender> {
  AuthGenderSection({
    super.key,
    ValueChanged<Gender>? onChanged,
    FormFieldValidator<Gender>? validator,
    AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
  }) : super(
    validator: validator ?? Validation.validateGender,
    autovalidateMode: autoValidateMode,
    builder: (state) {
      void selectGender(Gender gender) {
        state.didChange(gender);
        onChanged?.call(gender);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AuthGenderOption(
                  gender: Gender.male,
                  title: AppLocalization.registerGenderBoy,
                  emoji: AppStrings.boyIcon,
                  isSelected: state.value == Gender.male,
                  onTap: () => selectGender(Gender.male),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AuthGenderOption(
                  gender: Gender.female,
                  title: AppLocalization.registerGenderGirl,
                  emoji: AppStrings.girlIcon,
                  isSelected: state.value == Gender.female,
                  onTap: () => selectGender(Gender.female),
                ),
              ),
            ],
          ),

          if (state.hasError) ...[
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    color: Theme.of(state.context).colorScheme.error,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ],
      );
    },
  );
}
