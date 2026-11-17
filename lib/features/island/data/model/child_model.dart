import '../../domain/entity/child_entity.dart';

/// Data model representing child details received from the API.
class ChildModel {
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

  const ChildModel({
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

  /// Factory constructor to create a [ChildModel] from a JSON map.
  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      childName: json['child_name'] as String?,
      birthDate: json['birth_date'] as String?,
      age: json['age'] is int ? json['age'] as int? : int.tryParse(json['age']?.toString() ?? ''),
      gender: json['gender'] as String?,
      mentorGender: json['mentor_gender'] as String?,
      dialect: json['dialect'] as String?,
      grade: json['grade'] as String?,
      avatarPath: json['avatar_path'] as String?,
      currentIsland: json['current_island'] as String?,
      progressPercentage: json['progress_percentage'] as num?,
    );
  }

  /// Converts this [ChildModel] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'child_name': childName,
      'birth_date': birthDate,
      'age': age,
      'gender': gender,
      'mentor_gender': mentorGender,
      'dialect': dialect,
      'grade': grade,
      'avatar_path': avatarPath,
      'current_island': currentIsland,
      'progress_percentage': progressPercentage,
    };
  }

  /// Converts this [ChildModel] to a clean domain [ChildEntity].
  ChildEntity toEntity() {
    return ChildEntity(
      id: id,
      name: name,
      childName: childName,
      birthDate: birthDate,
      age: age,
      gender: gender,
      mentorGender: mentorGender,
      dialect: dialect,
      grade: grade,
      avatarPath: avatarPath,
      currentIsland: currentIsland,
      progressPercentage: progressPercentage,
    );
  }

  /// Creates a [ChildModel] from a domain [ChildEntity].
  factory ChildModel.fromEntity(ChildEntity entity) {
    return ChildModel(
      id: entity.id,
      name: entity.name,
      childName: entity.childName,
      birthDate: entity.birthDate,
      age: entity.age,
      gender: entity.gender,
      mentorGender: entity.mentorGender,
      dialect: entity.dialect,
      grade: entity.grade,
      avatarPath: entity.avatarPath,
      currentIsland: entity.currentIsland,
      progressPercentage: entity.progressPercentage,
    );
  }
}
