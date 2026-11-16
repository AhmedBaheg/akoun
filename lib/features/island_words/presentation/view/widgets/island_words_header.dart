import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/l10n_extension.dart';

class IslandWordsHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onCloseTap;

  const IslandWordsHeader({
    super.key,
    this.title,
    this.onCloseTap,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTitle = title ?? context.l10n.islandLetters;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // زر الإغلاق على اليسار
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onCloseTap ?? () => Navigator.of(context).maybePop(),
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 32.w,
                height: 32.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close_rounded,
                  size: 20.sp,
                  color: AppColors.islandWordsText,
                ),
              ),
            ),
          ),

          // عنوان الشاشة في المنتصف
          Text(
            effectiveTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.islandWordsTitle,
          ),
        ],
      ),
    );
  }
}

