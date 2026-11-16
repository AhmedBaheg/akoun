// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../core/common_widgets/app_primary_button.dart';
// import '../../../../core/router/app_router.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/utils/l10n_extension.dart';
// import '../../data/model/letter_phonics_model.dart';
// import 'widgets/learn_letter_header.dart';
// import 'widgets/remember_letter_card.dart';
//
// /// Screen displaying the articulation reminder ("تذكر") for the active letter.
// ///
// /// Features:
// /// - Navigation header with title "تذكر"
// /// - White card with yellow border showing letter exit / sound instructions
// /// - Bottom-border centered speaker button with yellow outline
// /// - Primary action button "حسنا"
// class RememberLetterView extends StatefulWidget {
//   final String letter;
//   final VoidCallback? onPlayAudio;
//
//   const RememberLetterView({super.key, this.letter = 'ب', this.onPlayAudio});
//
//   @override
//   State<RememberLetterView> createState() => _RememberLetterViewState();
// }
//
// class _RememberLetterViewState extends State<RememberLetterView> {
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
//     // Audio playback feedback
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
//             Flexible(
//               child: Text(
//                 'استمع لمخرج الحرف: ${_phonicsData.letter}',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.tajawal(
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.withe,
//                 ),
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
//   Future<void> _handleOkTap() async {
//     // Navigate to PronunciationPracticeView ("تدريب النطق")
//     final result = await context.push<bool>(
//       AppRouter.pronunciationPracticeView,
//       extra: widget.letter,
//     );
//
//     // If completed on pronunciation practice screen, return true
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
//             // 1. Navigation Header ("تذكر")
//             LearnLetterHeader(
//               title: context.l10n.rememberTitle,
//               onForward: () => context.push(
//                 AppRouter.pronunciationPracticeView,
//                 extra: widget.letter,
//               ),
//             ),
//
//             const Spacer(flex: 1),
//
//             // 2. Articulation Reminder Card with Overlapping Speaker Button
//             RememberLetterCard(
//               tipText: _phonicsData.articulationTip,
//               onSpeakerTap: _handleSpeakerTap,
//             ),
//
//             const Spacer(flex: 2),
//
//             // 3. Bottom Button ("حسنا")
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
//               child: AppPrimaryButton(
//                 title: context.l10n.okText,
//                 onPressed: _handleOkTap,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
