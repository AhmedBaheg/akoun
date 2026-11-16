import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extension.dart';
import 'widgets/learn_letter_header.dart';
import 'widgets/listening_letter_item.dart';

class ListeningPracticeView extends StatefulWidget {
  const ListeningPracticeView({super.key, required this.letter});

  final String letter;

  @override
  State<ListeningPracticeView> createState() => _ListeningPracticeViewState();
}

class _ListeningPracticeViewState extends State<ListeningPracticeView> {
  String? selectedLetter;
  bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.islandWordsBg,
      body: SafeArea(
        child: Column(
          children: [
            LearnLetterHeader(
              title: context.l10n.listeningTitle,
            ),
            SizedBox(height: 30.h),
            ListeningLetterItem(
              letter: 'ب',
              isSelected: selectedLetter == 'ب',
              isCorrect: isCorrect,
              onTap: () {
                setState(() {
                  selectedLetter = 'ب';
                  isCorrect = (selectedLetter == widget.letter);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
