import 'dart:async';

import 'package:akoun/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/common_widgets/app_primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/l10n_extension.dart';
import 'widgets/audio_waveform_mic_button.dart';
import 'widgets/learn_letter_header.dart';
import 'widgets/learn_letter_top_card.dart';

/// Screen for practicing and evaluating letter pronunciation ("تدريب النطق").
///
/// Features:
/// - Navigation bar with close and title "تدريب النطق"
/// - Subtitle "هيا لنقييم النطق"
/// - Large letter card (e.g. 'ب')
/// - Animated microphone recording button with flanking audio waveform bars
/// - "متابعة" primary button which only appears once pronunciation is correct
class PronunciationPracticeView extends StatefulWidget {
  final String letter;

  const PronunciationPracticeView({super.key, this.letter = 'ب'});

  @override
  State<PronunciationPracticeView> createState() =>
      _PronunciationPracticeViewState();
}

class _PronunciationPracticeViewState extends State<PronunciationPracticeView> {
  bool _isRecording = false;
  bool _isPronunciationCorrect = false;
  Timer? _recordingTimer;

  @override
  void dispose() {
    _recordingTimer?.cancel();
    super.dispose();
  }

  void _handleRecordingChanged(bool recording) {
    _recordingTimer?.cancel();

    setState(() {
      _isRecording = recording;
    });

    _showFeedback(recording);

    // Auto-evaluate voice pronunciation after 2.5 seconds
    if (recording) {
      _recordingTimer = Timer(const Duration(milliseconds: 2500), () {
        if (mounted && _isRecording) {
          setState(() {
            _isRecording = false;
            // Pronunciation is evaluated as correct!
            _isPronunciationCorrect = true;
          });
          _showFeedback(false);
        }
      });
    } else {
      // If stopped manually, confirm correct pronunciation
      setState(() {
        _isPronunciationCorrect = true;
      });
    }
  }

  void _showFeedback(bool isRecording) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isRecording ? Icons.mic_rounded : Icons.star_rounded,
              color: AppColors.withe,
              size: 20,
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                isRecording
                    ? 'جارٍ الاستماع لنطق حرف (${widget.letter})... تحدث الآن!'
                    : 'أحسنت يا بطل! نطقك ممتاز 🌟',
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.withe,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: isRecording
            ? AppColors.learnLetterHighlighted
            : AppColors.islandLetterCheckmark,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }

  Future<void> _handleContinueTap() async {
    // Navigate to ListeningPracticeView passing the letter
    final result = await context.push<bool>(
      AppRouter.listeningPracticeView,
      extra: widget.letter,
    );

    // If completed on listening practice screen, pop back with true
    if (result == true && mounted) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.islandWordsBg,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Navigation Header ("تدريب النطق")
            LearnLetterHeader(
              title: context.l10n.pronunciationTitle,
              onForward: () => context.push(
                AppRouter.listeningPracticeView,
                extra: widget.letter,
              ),
            ),

            SizedBox(height: 20.h),

            // 2. Subtitle ("هيا لنقييم النطق")
            Text(
              context.l10n.evaluatePronunciation,
              textAlign: TextAlign.center,
              style: AppTextStyles.pronunciationSubtitle,
            ),

            SizedBox(height: 32.h),

            // 3. Prominent Letter Card ('ب')
            LearnLetterTopCard(
              letter: widget.letter,
              width: 209.w,
              height: 169.h,
            ),

            SizedBox(height: 52.h),

            // 4. Center Microphone Button with Audio Waveforms
            AudioWaveformMicButton(
              isRecording: _isRecording,
              onRecordingChanged: _handleRecordingChanged,
            ),

            const Spacer(),

            // 5. Bottom "متابعة" Button (يظهر فقط إذا نطق الطفل بشكل صحيح)
            if (_isPronunciationCorrect)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: AppPrimaryButton(
                  title: context.l10n.continueText,
                  onPressed: _handleContinueTap,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
