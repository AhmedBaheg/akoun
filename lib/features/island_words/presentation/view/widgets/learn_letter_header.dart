import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/l10n_extension.dart';


/// Top navigation header for the Learn Letter screen.
///
/// Contains a close button on the left, the screen title in the center,
/// and a forward/back chevron button on the right.
class LearnLetterHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onClose;
  final VoidCallback? onForward;

  const LearnLetterHeader({
    super.key,
    this.title,
    this.onClose,
    this.onForward,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTitle = title ?? context.l10n.learnLetter;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Close button (Left)
          _HeaderSquareButton(
            icon: Icons.close_rounded,
            onTap: onClose ?? () => Navigator.of(context).maybePop(),
          ),

          // Title (Center)
          Text(
            effectiveTitle,
            style: AppTextStyles.learnLetterTitle,
          ),

          // Chevron forward/back button (Right)
          _HeaderSquareButton(
            icon: Icons.chevron_right_rounded,
            onTap: onForward ?? () => Navigator.of(context).maybePop(),
          ),
        ],
      ),
    );
  }
}

class _HeaderSquareButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _HeaderSquareButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Ink(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            color: AppColors.withe,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            size: 22.sp,
            color: AppColors.islandWordsText,
          ),
        ),
      ),
    );
  }
}
