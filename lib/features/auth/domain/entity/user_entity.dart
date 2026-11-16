/// Entity representing the parent and child user domain model.
class UserEntity {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;
  final String? avatarUrl;
  final String? language;

  // Child Profile Fields
  final String? childName;
  final dynamic age;
  final String? gender;
  final String? mentorGender;
  final String? dialectMentorUrl;

  const UserEntity({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.avatarUrl,
    this.language,
    this.childName,
    this.age,
    this.gender,
    this.mentorGender,
    this.dialectMentorUrl,
  });
}
