
import 'package:akoun/core/theme/app_colors.dart';
import 'package:akoun/core/utils/l10n_extension.dart';
import 'package:akoun/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import 'auth_teacher_type_option.dart';

enum TeacherType { male, female }

class AuthTeacherTypeSection extends FormField<TeacherType> {
  AuthTeacherTypeSection({
    super.key,
    ValueChanged<TeacherType>? onChanged,
    FormFieldValidator<TeacherType>? validator,
    AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
  }) : super(
    validator: validator ?? Validation.validateTeacherType,
    autovalidateMode: autoValidateMode,
    builder: (state) {
      void selectType(TeacherType type) {
        state.didChange(type);
        onChanged?.call(type);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AuthTeacherTypeOption(
                  title: state.context.l10n.registerTeacherMale,
                  subtitle: state.context.l10n.registerMaleGender,
                  image: AppStrings.teacherMaleIcon,
                  titleColor: AppColors.teacherMale,
                  isSelected: state.value == TeacherType.male,
                  onTap: () => selectType(TeacherType.male),
                ),
              ),

              SizedBox(width: 20.w),

              Expanded(
                child: AuthTeacherTypeOption(
                  title: state.context.l10n.registerTeacherFemale,
                  subtitle: state.context.l10n.registerFemaleGender,
                  image: AppStrings.teacherFemaleIcon,
                  titleColor: AppColors.teacherFemale,
                  isSelected: state.value == TeacherType.female,
                  onTap: () => selectType(TeacherType.female),
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
