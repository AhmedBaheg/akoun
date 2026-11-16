import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';


/// Interactive audio speaker button for pronouncing the letter and phonics phrase.
///
/// Provides visual pulse/ripple animation when tapped and triggers audio playback.
class LearnLetterSpeakerButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double? size;

  const LearnLetterSpeakerButton({
    super.key,
    this.onTap,
    this.size,
  });

  @override
  State<LearnLetterSpeakerButton> createState() =>
      _LearnLetterSpeakerButtonState();
}

class _LearnLetterSpeakerButtonState extends State<LearnLetterSpeakerButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    // Play system click/alert feedback
    SystemSound.play(SystemSoundType.click);

    setState(() => _isPlaying = true);
    await _controller.forward();
    await _controller.reverse();

    if (mounted) {
      setState(() => _isPlaying = false);
    }

    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final double buttonSize = widget.size ?? 48.w;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isPlaying
                  ? AppColors.learnLetterSpeakerBg.withValues(alpha: 0.9)
                  : AppColors.learnLetterSpeakerBg,
              boxShadow: [
                BoxShadow(
                  color: AppColors.learnLetterSpeakerIcon.withValues(
                    alpha: _isPlaying ? 0.35 : 0.15,
                  ),
                  blurRadius: _isPlaying ? 12 : 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.volume_up_rounded,
              color: AppColors.learnLetterSpeakerIcon,
              size: (buttonSize * 0.58).sp,
            ),
          ),
        ),
      ),
    );
  }
}
