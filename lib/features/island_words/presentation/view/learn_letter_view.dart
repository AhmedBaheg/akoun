// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../core/common_widgets/app_primary_button.dart';
// import '../../../../core/router/app_router.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/utils/l10n_extension.dart';
// import 'widgets/learn_letter_cards_stack.dart';
// import 'widgets/learn_letter_header.dart';
//
// /// Screen for teaching the child an Arabic letter and its phonics word ("تعلم الحرف").
// ///
// /// Features:
// /// - Top bar with close button, title ("تعلم الحرف"), and forward chevron.
// /// - Overlapping letter card ('ب') and word card ('بَطَّةَ') with illustration.
// /// - Interactive speaker button to listen to pronunciation and phrases.
// /// - "متابعة" primary button to advance the learning queue.
// class LearnLetterView extends StatefulWidget {
//   final String letter;
//   final VoidCallback? onPlayAudio;
//
//   const LearnLetterView({super.key, this.letter = 'ب', this.onPlayAudio});
//
//   @override
//   State<LearnLetterView> createState() => _LearnLetterViewState();
// }
//
// class _LearnLetterViewState extends State<LearnLetterView> {
//   late final LetterPhonicsModel _phonicsData;
//
//   @override
//   void initState() {
//     super.initState();
//     _phonicsData = LetterPhonicsModel.forLetter(widget.letter);
//   }
//
//   void _handleSpeakerTap() {
//     if (widget.onPlayAudio != null) {
//       widget.onPlayAudio!();
//       return;
//     }
//
//     // Interactive audio playback feedback
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(
//               Icons.volume_up_rounded,
//               color: AppColors.withe,
//               size: 20,
//             ),
//             SizedBox(width: 8.w),
//             Text(
//               'استمع: ${_phonicsData.spokenPhrase}',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.tajawal(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.withe,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: AppColors.primaryButton,
//         duration: const Duration(seconds: 2),
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _handleContinueTap() async {
//     // Navigate to RememberLetterView ("تذكر")
//     final result = await context.push<bool>(
//       AppRouter.rememberLetterView,
//       extra: widget.letter,
//     );
//
//     // If completed on the remember screen, return true back to IslandWordsView
//     if (result == true && mounted) {
//       Navigator.of(context).pop(true);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.islandWordsBg,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // 1. Top Bar (Close - Title - Chevron)
//             LearnLetterHeader(
//               onForward: () => context.push(AppRouter.rememberLetterView),
//             ),
//
//             const Spacer(flex: 1),
//
//             // 2. Overlapping Cards Section (Letter Card + Phonics Word Card)
//             LearnLetterCardsStack(
//               letter: _phonicsData.letter,
//               highlightedLetter: _phonicsData.highlightedPart,
//               remainingWord: _phonicsData.remainingWord,
//               imagePath: _phonicsData.imagePath,
//               onSpeakerTap: _handleSpeakerTap,
//             ),
//
//             const Spacer(flex: 2),
//
//             // 3. Bottom "متابعة" Button
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
//               child: AppPrimaryButton(
//                 title: context.l10n.continueText,
//                 onPressed: _handleContinueTap,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
