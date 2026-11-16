import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class IslandLockWidget extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;

  const IslandLockWidget({
    super.key,
    this.size = 48,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(
          color: AppColors.islandLockBg,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 4.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Image.asset(
          AppStrings.islandLockIcon,
          width: 16.w * (size / 48),
          height: 21.h * (size / 48),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
