import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'letter_card_widget.dart';

class LettersGridView extends StatelessWidget {
  final List<String> letters;
  final int selectedIndex;
  final LetterCardStatus Function(int index) getStatus;
  final void Function(int index, String letter) onLetterTap;

  const LettersGridView({
    super.key,
    required this.letters,
    this.selectedIndex = 0,
    required this.getStatus,
    required this.onLetterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 16.h),
        itemCount: letters.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 112 / 109,
        ),
        itemBuilder: (context, index) {
          final letter = letters[index];
          final status = getStatus(index);
          final isSelected = index == selectedIndex;

          return LetterCardWidget(
            letter: letter,
            status: status,
            isSelected: isSelected,
            onTap: () => onLetterTap(index, letter),
          );
        },
      ),
    );
  }
}
