
import 'package:akoun/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_localization.dart';
import '../../../../../core/utils/app_strings.dart';
import 'auth_teacher_type_option.dart';


enum TeacherType { male, female }

class AuthTeacherTypeSection extends StatefulWidget {
  final ValueChanged<TeacherType>? onChanged;

  const AuthTeacherTypeSection({
    super.key,
    this.onChanged,
  });

  @override
  State<AuthTeacherTypeSection> createState() =>
      _AuthTeacherTypeSectionState();
}

class _AuthTeacherTypeSectionState
    extends State<AuthTeacherTypeSection> {
  TeacherType? selectedType;

  void _selectType(TeacherType type) {
    setState(() {
      selectedType = type;
    });

    widget.onChanged?.call(type);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthTeacherTypeOption(
            title: AppLocalization.registerTeacherMale,
            subtitle: AppLocalization.registerMaleGender,
            image: AppStrings.teacherMaleIcon,
            titleColor: AppColors.teacherMale,
            isSelected: selectedType == TeacherType.male,
            onTap: () => _selectType(TeacherType.male),
          ),
        ),

        SizedBox(width: 20.w),

        Expanded(
          child: AuthTeacherTypeOption(
            title: AppLocalization.registerTeacherFemale,
            subtitle: AppLocalization.registerFemaleGender,
            image: AppStrings.teacherFemaleIcon,
            titleColor: AppColors.teacherFemale,
            isSelected: selectedType == TeacherType.female,
            onTap: () => _selectType(TeacherType.female),
          ),
        ),
      ],
    );
  }
}
