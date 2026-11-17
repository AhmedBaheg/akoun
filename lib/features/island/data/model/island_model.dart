import '../../domain/entity/island_entity.dart';

/// Data model representing an Island item received from the API.
class IslandModel {
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

  const IslandModel({
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

  /// Creates an [IslandModel] from a JSON map.
  factory IslandModel.fromJson(Map<String, dynamic> json) {
    return IslandModel(
      id: json['id'] as String?,
      islandId: json['island_id'] as int?,
      title: json['title'] as String?,
      titleKey: json['title_key'] as String?,
      type: json['type'] as String?,
      isUnlocked: json['is_unlocked'] as bool?,
      isCompleted: json['is_completed'] as bool?,
      starsCount: json['stars_count'] as int?,
      orderIndex: json['order_index'] as int?,
      price: json['price'] as num?,
      isTrial: json['is_trial'] as bool?,
      imageUrl: json['image_url'] as String?,
    );
  }

  /// Converts this [IslandModel] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'island_id': islandId,
      'title': title,
      'title_key': titleKey,
      'type': type,
      'is_unlocked': isUnlocked,
      'is_completed': isCompleted,
      'stars_count': starsCount,
      'order_index': orderIndex,
      'price': price,
      'is_trial': isTrial,
      'image_url': imageUrl,
    };
  }

  /// Converts this [IslandModel] to a domain [IslandEntity].
  IslandEntity toEntity() {
    return IslandEntity(
      id: id,
      islandId: islandId,
      title: title,
      titleKey: titleKey,
      type: type,
      isUnlocked: isUnlocked,
      isCompleted: isCompleted,
      starsCount: starsCount,
      orderIndex: orderIndex,
      price: price,
      isTrial: isTrial,
      imageUrl: imageUrl,
    );
  }

  /// Creates an [IslandModel] from a domain [IslandEntity].
  factory IslandModel.fromEntity(IslandEntity entity) {
    return IslandModel(
      id: entity.id,
      islandId: entity.islandId,
      title: entity.title,
      titleKey: entity.titleKey,
      type: entity.type,
      isUnlocked: entity.isUnlocked,
      isCompleted: entity.isCompleted,
      starsCount: entity.starsCount,
      orderIndex: entity.orderIndex,
      price: entity.price,
      isTrial: entity.isTrial,
      imageUrl: entity.imageUrl,
    );
  }
}
