import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/l10n_extension.dart';
import 'island_stat_badge.dart';

class IslandHeaderWidget extends StatelessWidget {
  final String? greeting;
  final String? subtitle;
  final String avatarPath;
  final int coins;
  final int stars;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onCoinsAddTap;
  final VoidCallback? onStarsAddTap;

  const IslandHeaderWidget({
    super.key,
    this.greeting,
    this.subtitle,
    this.avatarPath = AppStrings.islandAvatar,
    this.coins = 100,
    this.stars = 0,
    this.onAvatarTap,
    this.onCoinsAddTap,
    this.onStarsAddTap,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveGreeting = greeting ?? context.l10n.islandGoodMorning;
    final effectiveSubtitle = subtitle ?? context.l10n.islandContinueJourney;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Avatar with white circular border
          GestureDetector(
            onTap: onAvatarTap,
            child: Container(
              width: 73.w,
              height: 73.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.withe,
                  width: 3.w,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  avatarPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // 2. Greeting & Subtitle texts
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    effectiveGreeting,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.islandGreeting,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    effectiveSubtitle,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.islandSubtitle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // 3. Stat badges (Coins & Stars)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IslandStatBadge(
                iconPath: AppStrings.islandCoinIcon,
                value: '$coins',
                onAddTap: onCoinsAddTap,
              ),
              SizedBox(height: 5.h),
              IslandStatBadge(
                iconPath: AppStrings.islandStarIcon,
                value: '$stars',
                onAddTap: onStarsAddTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
