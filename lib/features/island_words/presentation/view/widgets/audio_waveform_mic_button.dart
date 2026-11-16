import 'package:akoun/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Interactive audio waveform and microphone button for pronunciation evaluation.
///
/// Shows a vibrant red circular mic button surrounded by 5 waveform audio bars on each side.
/// Animates the sound waves and button scale while recording.
class AudioWaveformMicButton extends StatefulWidget {
  final ValueChanged<bool>? onRecordingChanged;
  final VoidCallback? onMicTap;
  final bool isRecording;

  const AudioWaveformMicButton({
    super.key,
    this.onRecordingChanged,
    this.onMicTap,
    this.isRecording = false,
  });

  @override
  State<AudioWaveformMicButton> createState() => _AudioWaveformMicButtonState();
}

class _AudioWaveformMicButtonState extends State<AudioWaveformMicButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _waveController;
  late final Animation<double> _pulseAnimation;
  late bool _isRecording;

  static const List<double> _leftHeights = [12.0, 24.0, 36.0, 24.0, 12.0];
  static const List<double> _rightHeights = [12.0, 24.0, 36.0, 24.0, 12.0];

  @override
  void initState() {
    super.initState();
    _isRecording = widget.isRecording;

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.easeInOut),
    );

    if (_isRecording) {
      _waveController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant AudioWaveformMicButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRecording != oldWidget.isRecording &&
        widget.isRecording != _isRecording) {
      _isRecording = widget.isRecording;
      if (_isRecording) {
        if (!_waveController.isAnimating) {
          _waveController.repeat(reverse: true);
        }
      } else {
        _waveController.stop();
        _waveController.reset();
      }
    }
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  void _handleTap() {
    try {
      SystemSound.play(SystemSoundType.click);
    } catch (_) {}

    final nextState = !_isRecording;
    setState(() {
      _isRecording = nextState;
    });

    if (_isRecording) {
      if (!_waveController.isAnimating) {
        _waveController.repeat(reverse: true);
      }
    } else {
      _waveController.stop();
      _waveController.reset();
    }

    widget.onRecordingChanged?.call(_isRecording);
    widget.onMicTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _waveController,
      builder: (context, child) {
        final double animValue = _waveController.value;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Left Waveform Bars (5 bars)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_leftHeights.length, (index) {
                final baseHeight = _leftHeights[index].h;
                final factor = _isRecording
                    ? 1.0 + (0.5 * animValue * ((index % 2 == 0) ? 1.0 : -0.4))
                    : 1.0;
                final height = (baseHeight * factor).clamp(8.h, 48.h);

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                  child: Container(
                    width: 2.8.w,
                    height: height,
                    decoration: BoxDecoration(
                      color: const Color(0xFF374151),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(width: 14.w),

            // Center Red Microphone Button
            ScaleTransition(
              scale: _pulseAnimation,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _handleTap,
                  customBorder: const CircleBorder(),
                  child: Ink(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.learnLetterHighlighted,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.learnLetterHighlighted.withValues(
                            alpha: _isRecording ? 0.45 : 0.25,
                          ),
                          blurRadius: _isRecording ? 16 : 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        _isRecording
                            ? Icons.mic_rounded
                            : Icons.mic_none_rounded,
                        color: Colors.white,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 14.w),

            // Right Waveform Bars (5 bars)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_rightHeights.length, (index) {
                final baseHeight = _rightHeights[index].h;
                final factor = _isRecording
                    ? 1.0 + (0.5 * animValue * ((index % 2 != 0) ? 1.0 : -0.4))
                    : 1.0;
                final height = (baseHeight * factor).clamp(8.h, 48.h);

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                  child: Container(
                    width: 2.8.w,
                    height: height,
                    decoration: BoxDecoration(
                      color: const Color(0xFF374151),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
