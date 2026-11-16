import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/common_widgets/app_primary_button.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import 'widgets/island_words_header.dart';
import 'widgets/letter_card_widget.dart';
import 'widgets/letters_grid_view.dart';

class IslandWordsView extends StatefulWidget {
  const IslandWordsView({super.key});

  @override
  State<IslandWordsView> createState() => _IslandWordsViewState();
}

class _IslandWordsViewState extends State<IslandWordsView> {
  final List<String> letters = [
    'أ',
    'ب',
    'ت',
    'ث',
    'ج',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'هـ',
    'و',
    'ي',
  ];

  // أقصى حرف مفتوح في خطة التعلم (يبدأ من الحرف الأول 'أ')
  int currentQueueIndex = 0;

  // الحرف المختار حالياً للتفاعل وزر المتابعة
  int selectedIndex = 0;

  // الحروف المكتملة
  final Set<int> completedIndices = {};

  // تحديد حالة كل حرف (مكتمل / حالي مفتوح / مقفل)
  LetterCardStatus _getLetterStatus(int index) {
    if (completedIndices.contains(index)) {
      return LetterCardStatus.completed;
    } else if (index == currentQueueIndex) {
      return LetterCardStatus.current;
    } else {
      return LetterCardStatus.locked;
    }
  }

  // تسجيل إكمال الحرف وفتح التالي في الطابور إذا لزم
  void _completeLetter(int index) {
    setState(() {
      completedIndices.add(index);
      // لو الحرف المكتمل هو الحرف الحالي في الطابور نفتح التالي ونختاره
      if (index == currentQueueIndex && currentQueueIndex < letters.length - 1) {
        currentQueueIndex++;
        selectedIndex = currentQueueIndex;
      }
    });
  }

  // التفاعل عند النقر على أي بطاقة حرف
  void _handleLetterTap(int index, String letter) {
    final status = _getLetterStatus(index);

    if (status == LetterCardStatus.locked) {
      _showLockedSnackBar(letter);
    } else {
      // الحرف متاح (سواء مكتمل أو هو الحرف الحالي المفتوح) -> نحدده
      setState(() {
        selectedIndex = index;
      });
    }
  }

  // رسالة تنبيهية عند النقر على حرف مقفل
  void _showLockedSnackBar(String letter) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '!أكمل الحرف السابق أولاً لفتح حرف "$letter"',
          textAlign: TextAlign.center,
          style: GoogleFonts.tajawal(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.islandWordsText,
          ),
        ),
        backgroundColor: AppColors.islandWordsBg,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  // الضغط على زر متابعة للانتقال لصفحة الحرف المختار حالياً
  Future<void> _handleContinueTap() async {
    if (selectedIndex < letters.length) {
      final selectedLetter = letters[selectedIndex];

      final result = await context.push<bool>(
        AppRouter.learnLetterView,
        extra: selectedLetter,
      );

      // بعد العودة بالنجاح نُكمل الحرف ونفتح التالي
      if (result == true) {
        _completeLetter(selectedIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.islandWordsBg,
      body: SafeArea(
        child: Column(
          children: [
            // 1. الشريط العلوي (زر الإغلاق والعنوان)
            const IslandWordsHeader(),
            SizedBox(height: 8.h),

            // 2. شبكة الحروف
            Expanded(
              child: LettersGridView(
                letters: letters,
                selectedIndex: selectedIndex,
                getStatus: _getLetterStatus,
                onLetterTap: _handleLetterTap,
              ),
            ),

            // 3. زر المتابعة السفلي
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
      child: AppPrimaryButton(title: 'متابعة', onPressed: _handleContinueTap),
    );
  }
}
