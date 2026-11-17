import 'dart:developer';

import 'package:akoun/core/network/result.dart';
import 'package:akoun/features/island/domain/entity/child_entity.dart';
import 'package:akoun/features/island/domain/repo/child_repo.dart';
import 'package:dio/dio.dart';

import '../data_source/remote/profile/api_profile_remote_data_source.dart';

class ChildRepoImpl implements ChildRepo {
  final ApiProfileRemoteDataSource apiProfileRemoteDataSource;

  ChildRepoImpl({required this.apiProfileRemoteDataSource});

  @override
  Future<Result<ChildEntity>> getChildProfile() async {
    log('🏢 [ChildRepoImpl.getChildProfile] Fetching child child...');
    try {
      final childModel = await apiProfileRemoteDataSource.getChildProfile();
      log('✅ [ChildRepoImpl.getChildProfile] Success for child: ${childModel.childName ?? childModel.name}');
      return Success(data: childModel.toEntity());
    } on DioException catch (e) {
      log('❌ [ChildRepoImpl.getChildProfile] DioException: ${e.response?.statusCode}');
      final serverMessage = e.response?.data is Map<String, dynamic>
          ? e.response?.data['message'] as String?
          : null;
      return Failure(
        errorMessage: serverMessage ?? 'حدث خطأ في جلب بيانات الطفل',
      );
    } catch (e) {
      log('❌ [ChildRepoImpl.getChildProfile] Exception: $e');
      return Failure(errorMessage: e.toString());
    }
  }
}
