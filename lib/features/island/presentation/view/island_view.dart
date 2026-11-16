import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/app_background_image.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/l10n_extension.dart';
import 'widgets/island_header_widget.dart';
import 'widgets/island_widget.dart';

class IslandView extends StatelessWidget {
  const IslandView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final totalHeight = math.max(956.h, screenHeight);

    return Scaffold(
      backgroundColor: const Color(0xFF1B61B9),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B61B9), Color(0xFF0077B6)],
          ),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            width: 393.w,
            height: totalHeight,
            child: AppBackgroundImage(
              image: AppStrings.islandBg,
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  Positioned(
                    left: 20.w,
                    top: 80.h,
                    right: 20.w,
                    child: const IslandHeaderWidget(),
                  ),

                  // 1. جزيرة الحروف (مفتوحة والنشطة حالياً)
                  Positioned(
                    left: 46.w,
                    top: 208.h,
                    child: IslandWidget(
                      title: context.l10n.islandLetters,
                      imagePath: AppStrings.islandLetters,
                      imageWidth: 80,
                      imageHeight: 85,
                      textOffsetY: 50,
                      showArrow: true,
                      onTap: (){
                        context.push(AppRouter.islandWordsView);
                      },
                    ),
                  ),

                  // قارب الإبحار بين الجزر
                  Positioned(
                    left: 111.w,
                    top: 318.h,
                    child: Image.asset(
                      AppStrings.islandBoat,
                      width: 119.w,
                      height: 119.h,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // 2. جزيرة الحركات (مغلقة)
                  Positioned(
                    left: 221.w,
                    top: 302.h,
                    child: IslandWidget(
                      title: context.l10n.islandMovements,
                      imagePath: AppStrings.islandMovements,
                      imageWidth: 152,
                      imageHeight: 100,
                      textOffsetY: 40,
                      isLocked: true,
                    ),
                  ),

                  // 3. جزيرة حروف المد (مغلقة)
                  Positioned(
                    left: 46.w,
                    top: 372.h,
                    child:  IslandWidget(
                      title: context.l10n.islandMadd,
                      imagePath: AppStrings.islandMadd,
                      imageWidth: 120,
                      imageHeight: 106,
                      textOffsetY: 50,
                      isLocked: true,
                    ),
                  ),

                  // 4. جزيرة الكلمات (مغلقة)
                  Positioned(
                    left: 216.w,
                    top: 454.h,
                    child:  IslandWidget(
                      title: context.l10n.islandWords,
                      imagePath: AppStrings.islandWords,
                      imageWidth: 159,
                      imageHeight: 150,
                      textOffsetY: 50,
                      isLocked: true,
                    ),
                  ),

                  // 5. جزيرة الجمل والقواعد (مغلقة)
                  Positioned(
                    left: 22.w,
                    top: 592.h,
                    child:  IslandWidget(
                      title: context.l10n.islandGrammar,
                      imagePath: AppStrings.islandGrammar,
                      imageWidth: 194,
                      imageHeight: 114,
                      textOffsetY: 50,
                      isLocked: true,
                    ),
                  ),

                  // 6. الكنز الكبير
                  Positioned(
                    left: 104.w,
                    top: 787.h,
                    child: IslandWidget(
                      title: context.l10n.islandTreasure,
                      imagePath: AppStrings.islandTreasure,
                      imageWidth: 110,
                      imageHeight: 110,
                      textOffsetY: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
