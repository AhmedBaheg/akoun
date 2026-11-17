import 'dart:developer';
import 'dart:math' as math;

import 'package:akoun/features/island/data/data_source/remote/island/api_island_remote_data_source_impl.dart';
import 'package:akoun/features/island/data/data_source/remote/profile/api_profile_remote_data_source_impl.dart';
import 'package:akoun/features/island/data/repo/child_repo_impl.dart';
import 'package:akoun/features/island/domain/entity/island_entity.dart';
import 'package:akoun/features/island/domain/use_case/get_child_profile_use_case.dart';
import 'package:akoun/features/island/presentation/cubit/child/child_cubit.dart';
import 'package:akoun/features/island/presentation/cubit/island/island_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/app_background_image.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../data/repo/island_repo_impl.dart';
import '../../domain/use_case/get_island_list_use_case.dart';
import 'widgets/island_header_widget.dart';
import 'widgets/island_widget.dart';

/// Layout configuration slot for an island on the interactive map.
class _IslandSlotConfig {
  final double left;
  final double top;
  final double imageWidth;
  final double imageHeight;
  final double textOffsetY;
  final String key;
  final int slotIndex;
  final String defaultTitle;
  final String defaultImage;
  final VoidCallback? onTap;

  const _IslandSlotConfig({
    required this.left,
    required this.top,
    required this.imageWidth,
    required this.imageHeight,
    required this.textOffsetY,
    required this.key,
    required this.slotIndex,
    required this.defaultTitle,
    required this.defaultImage,
    this.onTap,
  });
}

class IslandView extends StatelessWidget {
  const IslandView({super.key});

  /// Finds the matching [IslandEntity] strictly by key, or falls back to index position.
  IslandEntity? _findIsland(
    List<IslandEntity> islands,
    String key,
    int slotIndex,
  ) {
    if (islands.isEmpty) return null;

    final lowerKey = key.toLowerCase();

    // 1. Match strictly by key (type / id / titleKey)
    for (final island in islands) {
      final id = (island.id ?? '').toLowerCase();
      final type = (island.type ?? '').toLowerCase();
      final titleKey = (island.titleKey ?? '').toLowerCase();

      if (id.contains(lowerKey) ||
          type.contains(lowerKey) ||
          titleKey.contains(lowerKey)) {
        return island;
      }
    }

    // 2. Fallback to index position if within list bounds
    if (slotIndex >= 0 && slotIndex < islands.length) {
      return islands[slotIndex];
    }

    return null;
  }

  List<_IslandSlotConfig> _getSlotConfigs(BuildContext context) => [
    _IslandSlotConfig(
      left: 46.w,
      top: 208.h,
      imageWidth: 80,
      imageHeight: 85,
      textOffsetY: 50,
      key: 'character',
      slotIndex: 0,
      defaultTitle: context.l10n.islandLetters,
      defaultImage: AppStrings.islandLetters,
      onTap: () => context.push(AppRouter.islandWordsView),
    ),
    _IslandSlotConfig(
      left: 221.w,
      top: 302.h,
      imageWidth: 152,
      imageHeight: 100,
      textOffsetY: 40,
      key: 'movement',
      slotIndex: 1,
      defaultTitle: context.l10n.islandMovements,
      defaultImage: AppStrings.islandMovements,
    ),
    _IslandSlotConfig(
      left: 46.w,
      top: 372.h,
      imageWidth: 120,
      imageHeight: 106,
      textOffsetY: 50,
      key: 'madd',
      slotIndex: 2,
      defaultTitle: context.l10n.islandMadd,
      defaultImage: AppStrings.islandMadd,
    ),
    _IslandSlotConfig(
      left: 216.w,
      top: 454.h,
      imageWidth: 159,
      imageHeight: 150,
      textOffsetY: 50,
      key: 'word',
      slotIndex: 3,
      defaultTitle: context.l10n.islandWords,
      defaultImage: AppStrings.islandWords,
    ),
    _IslandSlotConfig(
      left: 22.w,
      top: 592.h,
      imageWidth: 194,
      imageHeight: 114,
      textOffsetY: 50,
      key: 'grammar',
      slotIndex: 4,
      defaultTitle: context.l10n.islandGrammar,
      defaultImage: AppStrings.islandGrammar,
    ),
    _IslandSlotConfig(
      left: 104.w,
      top: 787.h,
      imageWidth: 110,
      imageHeight: 110,
      textOffsetY: 40,
      key: 'treasure',
      slotIndex: 5,
      defaultTitle: context.l10n.islandTreasure,
      defaultImage: AppStrings.islandTreasure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final totalHeight = math.max(956.h, screenHeight);
    final slotConfigs = _getSlotConfigs(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1B61B9),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IslandCubit(
              getIslandListUseCase: GetIslandListUseCase(
                islandRepo: IslandRepoImpl(
                  apiIslandRemoteDataSource: ApiIslandRemoteDataSourceImpl(
                    apiService: ApiService(),
                  ),
                ),
              ),
            )..getIslandList(),
          ),
          BlocProvider(
            create: (context) => ChildCubit(
              getChildProfileUseCase: GetChildProfileUseCase(
                childRepo: ChildRepoImpl(
                  apiProfileRemoteDataSource: ApiProfileRemoteDataSourceImpl(
                    apiService: ApiService(),
                  ),
                ),
              ),
            )..getChildProfile(),
          ),
        ],
        child: Container(
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
                child: BlocConsumer<IslandCubit, IslandState>(
                  listener: (context, state) {
                    if (state is IslandFailure) {
                      log(
                        '🚨 [IslandView.BlocConsumer] IslandFailure: ${state.errorMessage}',
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    List<IslandEntity> islands = [];
                    if (state is IslandSuccess) {
                      islands = state.islandList;
                      log(
                        '👁️ [IslandView.BlocBuilder] IslandSuccess! Total islands count (length): ${islands.length}',
                      );
                      for (int i = 0; i < islands.length; i++) {
                        log(
                          '   [$i] ID: ${islands[i].id}, Title: ${islands[i].title}, Type: ${islands[i].type}, OrderIndex: ${islands[i].orderIndex}, IsUnlocked: ${islands[i].isUnlocked}',
                        );
                      }
                    }

                    return Stack(
                      children: [
                        // مؤشر التحميل في أعلى الخريطة عند طلب البيانات
                        if (state is IslandLoading)
                          Positioned(
                            top: 140.h,
                            left: 0,
                            right: 0,
                            child: const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),

                        // Header Widget loaded dynamically from ChildCubit
                        Positioned(
                          left: 20.w,
                          top: 80.h,
                          right: 20.w,
                          child: BlocBuilder<ChildCubit, ChildState>(
                            builder: (context, childState) {
                              String? childName;
                              String? gender;
                              String? avatarUrl;

                              if (childState is ChildSuccess) {
                                childName =
                                    childState.childEntity.childName ??
                                    childState.childEntity.name;
                                gender = childState.childEntity.gender;
                                avatarUrl = childState.childEntity.avatarPath;
                              }

                              return IslandHeaderWidget(
                                childName: childName,
                                gender: gender,
                                avatarUrl: avatarUrl,
                              );
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

                        // رسم كل الجزر ديناميكياً بأسلوب نظيف وبدون تكرار
                        for (final slot in slotConfigs) ...[
                          Builder(
                            builder: (context) {
                              final islandEntity = _findIsland(
                                islands,
                                slot.key,
                                slot.slotIndex,
                              );
                              final bool isUnlocked = islandEntity != null
                                  ? (islandEntity.isUnlocked ??
                                        (slot.slotIndex == 0))
                                  : (slot.slotIndex == 0);

                              return Positioned(
                                left: slot.left,
                                top: slot.top,
                                child: IslandWidget(
                                  title:
                                      islandEntity?.title ?? slot.defaultTitle,
                                  imagePath:
                                      islandEntity?.localImagePath ??
                                      slot.defaultImage,
                                  imageUrl: islandEntity?.imageUrl,
                                  imageWidth: slot.imageWidth,
                                  imageHeight: slot.imageHeight,
                                  textOffsetY: slot.textOffsetY,
                                  isLocked: !isUnlocked,
                                  showArrow: isUnlocked && slot.slotIndex == 0,
                                  onTap: slot.onTap,
                                ),
                              );
                            },
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
