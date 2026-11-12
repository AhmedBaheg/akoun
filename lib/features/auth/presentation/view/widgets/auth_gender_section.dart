
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../core/utils/app_localization.dart';
import '../../../../../core/utils/app_strings.dart';
import 'auth_gender_option.dart';

enum Gender { male, female }

class AuthGenderSection extends StatefulWidget {
  final ValueChanged<Gender>? onChanged;

  const AuthGenderSection({
    super.key,
    this.onChanged,
  });

  @override
  State<AuthGenderSection> createState() => _AuthGenderSectionState();
}

class _AuthGenderSectionState extends State<AuthGenderSection> {
  Gender? selectedGender;

  void _selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });

    widget.onChanged?.call(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthGenderOption(
            gender: Gender.male,
            title: AppLocalization.registerGenderBoy,
            emoji: AppStrings.boyIcon,
            isSelected: selectedGender == Gender.male,
            onTap: () => _selectGender(Gender.male),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: AuthGenderOption(
            gender: Gender.female,
            title: AppLocalization.registerGenderGirl,
            emoji: AppStrings.girlIcon,
            isSelected: selectedGender == Gender.female,
            onTap: () => _selectGender(Gender.female),
          ),
        ),
      ],
    );
  }
}

