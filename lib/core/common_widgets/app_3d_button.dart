
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class App3DButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const App3DButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      height: 80.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD000),
              borderRadius: BorderRadius.circular(50.r),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF806900),
                  width: 7.h,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.20),
                  offset: Offset(0, 5.h),
                  blurRadius: 3.r,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: GoogleFonts.tajawal(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF806900),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
