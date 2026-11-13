import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class AuthTextFormField extends StatelessWidget {
  final double borderRadius;
  final String prefixIcon;
  final String hint;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;

  const AuthTextFormField({
    super.key,
    required this.borderRadius,
    required this.prefixIcon,
    required this.hint,
    required this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          textDirection: TextDirection.rtl,
          cursorColor: AppColors.hint,
          validator: validator,
          keyboardType: keyboardType,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.hint, fontSize: 14.sp),
            filled: true,
            fillColor: AppColors.withe,

            prefixIcon: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                right: 16.w,
                bottom: 20.h,
                left: 9.w,
              ),
              child: Image.asset(prefixIcon, fit: BoxFit.contain),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: AppColors.borders, width: 2.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: AppColors.borders, width: 2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: AppColors.borders, width: 2.w),
            ),
          ),
        ),
      ),
    );
  }
}
