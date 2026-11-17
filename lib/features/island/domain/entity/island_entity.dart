import '../../../../core/utils/app_strings.dart';

/// Entity representing an Island domain model.
class IslandEntity {
  final String? id;
  final int? islandId;
  final String? title;
  final String? titleKey;
  final String? type;
  final bool? isUnlocked;
  final bool? isCompleted;
  final int? starsCount;
  final int? orderIndex;
  final num? price;
  final bool? isTrial;
  final String? imageUrl;

  const IslandEntity({
    this.id,
    this.islandId,
    this.title,
    this.titleKey,
    this.type,
    this.isUnlocked,
    this.isCompleted,
    this.starsCount,
    this.orderIndex,
    this.price,
    this.isTrial,
    this.imageUrl,
  });

  /// Returns the corresponding local asset image path from [AppStrings]
  /// based on the island type, id, or titleKey.
  String get localImagePath {
    final key = (type ?? id ?? titleKey ?? '').toLowerCase();

    if (key.contains('character') || key.contains('letter')) {
      return AppStrings.islandLetters;
    } else if (key.contains('movement') || key.contains('harakat')) {
      return AppStrings.islandMovements;
    } else if (key.contains('madd')) {
      return AppStrings.islandMadd;
    } else if (key.contains('word')) {
      return AppStrings.islandWords;
    } else if (key.contains('grammar') || key.contains('sentence')) {
      return AppStrings.islandGrammar;
    } else if (key.contains('treasure')) {
      return AppStrings.islandTreasure;
    }

    return AppStrings.islandLetters;
  }
}
