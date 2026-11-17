import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/l10n_extension.dart';
import '../../../../../core/utils/validation.dart';
import 'auth_gender_option.dart';

enum Gender { male, female }

extension GenderX on Gender {
  String get value {
    switch (this) {
      case Gender.male:
        return 'boy';
      case Gender.female:
        return 'girl';
    }
  }
}

class AuthGenderSection extends FormField<Gender> {
  AuthGenderSection({
    super.key,
    Gender? initialValue,
    ValueChanged<Gender>? onChanged,
    FormFieldSetter<Gender>? onSaved,
    FormFieldValidator<Gender>? validator,
    AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
  }) : super(
    initialValue: initialValue ?? Gender.male,
    validator: validator ?? Validation.validateGender,
    onSaved: onSaved,
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
                  title: state.context.l10n.registerGenderBoy,
                  emoji: AppStrings.boyIcon,
                  isSelected: state.value == Gender.male,
                  onTap: () => selectGender(Gender.male),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AuthGenderOption(
                  gender: Gender.female,
                  title: state.context.l10n.registerGenderGirl,
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
