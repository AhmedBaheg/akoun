import 'dart:developer';

import 'package:akoun/core/network/result.dart';
import 'package:akoun/features/auth/domain/entity/user_entity.dart';
import 'package:akoun/features/auth/domain/repo/auth_repo.dart';
import 'package:dio/dio.dart';

import '../data_source/remote/api_auth_remote_data_source.dart';
import '../model/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiAuthRemoteDataSource apiAuthRemoteDataSource;

  AuthRepoImpl({required this.apiAuthRemoteDataSource});

  @override
  Future<Result<void>> register(UserEntity entity) async {
    log('🏢 [AuthRepoImpl.register] Invoked for email: ${entity.email}');
    try {
      final userModel = UserModel.fromEntity(entity);
      await apiAuthRemoteDataSource.register(userModel);
      log('✅ [AuthRepoImpl.register] Success!');
      return Success(data: null);
    } on DioException catch (e) {
      log('❌ [AuthRepoImpl.register] DioException caught:');
      log('   StatusCode: ${e.response?.statusCode}');
      log('   Response Data: ${e.response?.data}');

      String? errorMsg;
      if (e.response?.data is Map<String, dynamic>) {
        final data = e.response?.data as Map<String, dynamic>;
        if (data['errors'] is Map<String, dynamic>) {
          final errorsMap = data['errors'] as Map<String, dynamic>;
          if (errorsMap.isNotEmpty) {
            final firstErrorList = errorsMap.values.first;
            if (firstErrorList is List && firstErrorList.isNotEmpty) {
              errorMsg = firstErrorList.first.toString();
            }
          }
        }
        errorMsg ??= data['message'] as String?;
      }

      final finalMessage = errorMsg ?? 'حدث خطأ في الاتصال، يرجى المحاولة لاحقاً';
      log('❌ [AuthRepoImpl.register] Failure message: $finalMessage');
      return Failure(errorMessage: finalMessage);
    } catch (e) {
      log('❌ [AuthRepoImpl.register] Exception caught: $e');
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> login(UserEntity entity) async {
    log('🏢 [AuthRepoImpl.login] Invoked for email: ${entity.email}');
    try {
      final userModel = UserModel.fromEntity(entity);
      await apiAuthRemoteDataSource.login(userModel);
      log('✅ [AuthRepoImpl.login] Success!');
      return Success(data: null);
    } on DioException catch (e) {
      log('❌ [AuthRepoImpl.login] DioException caught:');
      log('   StatusCode: ${e.response?.statusCode}');
      log('   Response Data: ${e.response?.data}');

      String? errorMsg;
      if (e.response?.data is Map<String, dynamic>) {
        final data = e.response?.data as Map<String, dynamic>;
        if (data['errors'] is Map<String, dynamic>) {
          final errorsMap = data['errors'] as Map<String, dynamic>;
          if (errorsMap.isNotEmpty) {
            final firstErrorList = errorsMap.values.first;
            if (firstErrorList is List && firstErrorList.isNotEmpty) {
              errorMsg = firstErrorList.first.toString();
            }
          }
        }
        errorMsg ??= data['message'] as String?;
      }

      final finalMessage = errorMsg ?? 'حدث خطأ في الاتصال، يرجى المحاولة لاحقاً';
      log('❌ [AuthRepoImpl.login] Failure message: $finalMessage');
      return Failure(errorMessage: finalMessage);
    } catch (e) {
      log('❌ [AuthRepoImpl.login] Exception caught: $e');
      return Failure(errorMessage: e.toString());
    }
  }
}
