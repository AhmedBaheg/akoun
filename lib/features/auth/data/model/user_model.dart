import '../../domain/entity/user_entity.dart';

/// Data model representing user authentication, parent, and child details.
class UserModel {
  // Token Metadata
  final String? token;
  final String? tokenType;
  final int? expiresIn;

  // Parent Profile Fields
  final String? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? password;
  final String? avatarUrl;
  final String? language;
  final String? createdAt;

  // Child Profile Fields
  final String? childId;
  final String? childName;
  final String? birthDate;
  final dynamic age;
  final String? gender;
  final String? mentorGender;
  final String? dialect;
  final String? childAvatarUrl;

  const UserModel({
    this.token,
    this.tokenType,
    this.expiresIn,
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.avatarUrl,
    this.language,
    this.createdAt,
    this.childId,
    this.childName,
    this.birthDate,
    this.age,
    this.gender,
    this.mentorGender,
    this.dialect,
    this.childAvatarUrl,
  });

  /// Factory constructor to create a [UserModel] from a JSON response map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;
    final parent = data['parent'] as Map<String, dynamic>?;
    final child = data['child'] as Map<String, dynamic>?;

    return UserModel(
      token: data['token'] as String?,
      tokenType: data['token_type'] as String?,
      expiresIn: data['expires_in'] as int?,
      id: parent?['id']?.toString() ?? data['id']?.toString(),
      fullName: parent?['full_name'] as String? ?? data['full_name'] as String?,
      email: parent?['email'] as String? ?? data['email'] as String?,
      phone: parent?['phone'] as String? ?? data['phone'] as String?,
      avatarUrl: parent?['avatar_url'] as String? ?? data['avatar_url'] as String?,
      language: parent?['language'] as String? ?? data['language'] as String?,
      createdAt: parent?['created_at'] as String? ?? data['created_at'] as String?,
      childId: child?['id']?.toString() ?? data['child_id']?.toString(),
      childName: child?['child_name'] as String? ?? data['child_name'] as String?,
      birthDate: child?['birth_date'] as String? ?? data['birth_date'] as String?,
      age: child?['age'] ?? data['age'],
      gender: child?['gender'] as String? ?? data['gender'] as String?,
      mentorGender: child?['mentor_gender'] as String? ?? data['mentor_gender'] as String?,
      dialect: child?['dialect'] as String? ?? data['dialect'] as String?,
      childAvatarUrl: child?['avatar_url'] as String? ?? data['child_avatar_url'] as String?,
    );
  }

  /// Converts this [UserModel] to a JSON payload map for API requests.
  Map<String, dynamic> toJson() {
    return {
      if (token != null) 'token': token,
      if (tokenType != null) 'token_type': tokenType,
      if (expiresIn != null) 'expires_in': expiresIn,
      if (id != null) 'id': id,
      'full_name': fullName ?? childName,
      'email': email,
      'phone': phone,
      if (password != null) 'password': password,
      if (password != null) 'password_confirmation': password,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      'language': language ?? 'ar',
      if (createdAt != null) 'created_at': createdAt,
      if (childId != null) 'child_id': childId,
      'child_name': childName,
      if (birthDate != null) 'birth_date': birthDate,
      'age': age,
      'gender': gender,
      'mentor_gender': mentorGender,
      'dialect': dialect,
      if (childAvatarUrl != null) 'child_avatar_url': childAvatarUrl,
    };
  }

  /// Converts this [UserModel] to a clean domain [UserEntity].
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
      avatarUrl: avatarUrl,
      language: language,
      childName: childName,
      age: age,
      gender: gender,
      mentorGender: mentorGender,
      dialectMentorUrl: dialect,
    );
  }

  /// Creates a [UserModel] from a domain [UserEntity].
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      phone: entity.phone,
      password: entity.password,
      avatarUrl: entity.avatarUrl,
      language: entity.language,
      childName: entity.childName,
      age: entity.age,
      gender: entity.gender,
      mentorGender: entity.mentorGender,
      dialect: entity.dialectMentorUrl,
    );
  }
}
