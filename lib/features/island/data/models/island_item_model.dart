enum IslandStatus {
  active,
  unlocked,
  locked,
  completed,
}

class IslandItemModel {
  final int id;
  final String title;
  final String imagePath;
  final IslandStatus status;
  final double x;
  final double y;
  final double width;
  final double height;

  const IslandItemModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.status,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  bool get isActive => status == IslandStatus.active;
  bool get isLocked => status == IslandStatus.locked;
}
