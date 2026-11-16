import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

/// Letter choice item widget for the listening practice screen ("iPhone 16 - 13").
///
/// Corresponds to the letter items inside `Frame 50` in Figma node `129:723`.
///
/// Features:
/// - Rounded white card with subtle elevation shadow matching Figma dimensions.
/// - Prominent Arabic letter glyph styled with `AppTextStyles.listeningLetterOption`.
/// - Supports 3 interactive visual states:
///   1. Neutral / Unselected (pure white card, subtle shadow, navy blue letter)
///   2. Correct selection (soft mint green background `AppColors.listeningCorrectCardBg`,
///      green border `AppColors.listeningCorrectCardBorder`)
///   3. Wrong selection (soft coral red background `AppColors.listeningWrongCardBg`,
///      red border `AppColors.listeningWrongCardBorder`)
/// - Tactile spring-scale animation and click feedback on tap.
class ListeningLetterItem extends StatefulWidget {
  final String letter;
  final bool isSelected;
  final bool? isCorrect;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const ListeningLetterItem({
    super.key,
    required this.letter,
    this.isSelected = false,
    this.isCorrect,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  State<ListeningLetterItem> createState() => _ListeningLetterItemState();
}

class _ListeningLetterItemState extends State<ListeningLetterItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 140),
      lowerBound: 0.0,
      upperBound: 0.08,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onTap == null) return;

    try {
      SystemSound.play(SystemSoundType.click);
    } catch (_) {}

    _scaleController.forward().then((_) {
      if (mounted) {
        _scaleController.reverse();
      }
    });

    widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Border border = Border.all(color: Colors.white, width: 2.w);
    List<BoxShadow> shadows = [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ];

    if (widget.isSelected) {
      if (widget.isCorrect == true) {
        // Correct answer state (mint green)
        backgroundColor = AppColors.listeningCorrectCardBg;
        border = Border.all(
          color: AppColors.listeningCorrectCardBorder,
          width: 2.5.w,
        );
        shadows = [
          BoxShadow(
            color: AppColors.listeningCorrectCardBorder.withValues(alpha: 0.3),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ];
      } else if (widget.isCorrect == false) {
        // Wrong answer state (coral red)
        backgroundColor = AppColors.listeningWrongCardBg;
        border = Border.all(
          color: AppColors.listeningWrongCardBorder,
          width: 2.5.w,
        );
        shadows = [
          BoxShadow(
            color: AppColors.listeningWrongCardBorder.withValues(alpha: 0.3),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ];
      }
    }

    final double itemWidth = widget.width ?? 102.w;
    final double itemHeight = widget.height ?? 108.h;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: itemWidth,
          height: itemHeight,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
            border: border,
            boxShadow: shadows,
          ),
          child: Center(
            child: Text(
              widget.letter,
              textAlign: TextAlign.center,
              style: AppTextStyles.listeningLetterOption,
            ),
          ),
        ),
      ),
    );
  }
}
