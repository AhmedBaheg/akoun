/// Entity representing a child child domain model.
class ChildEntity {
  final int? id;
  final String? name;
  final String? childName;
  final String? birthDate;
  final int? age;
  final String? gender;
  final String? mentorGender;
  final String? dialect;
  final String? grade;
  final String? avatarPath;
  final String? currentIsland;
  final num? progressPercentage;

  const ChildEntity({
    this.id,
    this.name,
    this.childName,
    this.birthDate,
    this.age,
    this.gender,
    this.mentorGender,
    this.dialect,
    this.grade,
    this.avatarPath,
    this.currentIsland,
    this.progressPercentage,
  });
}
