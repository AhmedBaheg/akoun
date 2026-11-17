import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/l10n_extension.dart';
import 'island_stat_badge.dart';

class IslandHeaderWidget extends StatelessWidget {
  final String? childName;
  final String? greeting;
  final String? subtitle;
  final String? avatarPath;
  final String? avatarUrl;
  final String? gender;
  final bool? isGirl;
  final int coins;
  final int stars;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onCoinsAddTap;
  final VoidCallback? onStarsAddTap;

  const IslandHeaderWidget({
    super.key,
    this.childName,
    this.greeting,
    this.subtitle,
    this.avatarPath,
    this.avatarUrl,
    this.gender,
    this.isGirl,
    this.coins = 100,
    this.stars = 0,
    this.onAvatarTap,
    this.onCoinsAddTap,
    this.onStarsAddTap,
  });

  String get _resolvedAvatarAsset {
    if (avatarPath != null && avatarPath!.isNotEmpty) {
      return avatarPath!;
    }
    final g = (gender ?? '').toLowerCase();
    final bool checkGirl = isGirl == true ||
        g == 'female' ||
        g == 'girl' ||
        g.contains('female') ||
        g.contains('girl');

    if (checkGirl) {
      return AppStrings.avatarGirlIcon;
    }
    return AppStrings.islandAvatar;
  }

  String _resolvedGreeting(BuildContext context) {
    if (greeting != null && greeting!.isNotEmpty) {
      return greeting!;
    }
    final name = childName?.trim();
    if (name != null && name.isNotEmpty) {
      return 'اهلا بيك يا $name !';
    }
    return context.l10n.islandGoodMorning;
  }

  Widget _buildAvatarImage() {
    final bool hasValidNetworkUrl =
        avatarUrl != null && avatarUrl!.trim().startsWith('http');

    if (hasValidNetworkUrl) {
      return Image.network(
        avatarUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            _resolvedAvatarAsset,
            fit: BoxFit.cover,
          );
        },
      );
    }

    return Image.asset(
      _resolvedAvatarAsset,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveGreeting = _resolvedGreeting(context);
    final effectiveSubtitle = subtitle ?? context.l10n.islandContinueJourney;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Avatar with white circular border & dynamic gender image
          GestureDetector(
            onTap: onAvatarTap,
            child: Container(
              width: 73.w,
              height: 73.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.withe, width: 3.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: _buildAvatarImage(),
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
