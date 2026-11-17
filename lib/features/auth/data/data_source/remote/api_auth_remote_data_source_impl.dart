import 'dart:developer';

import 'package:akoun/core/services/api_service.dart';
import 'package:akoun/features/auth/data/model/user_model.dart';

import 'api_auth_remote_data_source.dart';

class ApiAuthRemoteDataSourceImpl implements ApiAuthRemoteDataSource {
  final ApiService apiService;

  ApiAuthRemoteDataSourceImpl({required this.apiService});

  void _saveTokenFromResponse(dynamic response) {
    if (response is Map<String, dynamic>) {
      final data = response['data'] as Map<String, dynamic>?;
      final token = data?['token'] as String? ?? response['token'] as String?;
      if (token != null && token.isNotEmpty) {
        ApiService.userToken = token;
        log('🔑 [ApiAuthRemoteDataSourceImpl] Saved ApiService.userToken: $token');
      }
    }
  }

  @override
  Future<void> register(UserModel userModel) async {
    log('📡 [ApiAuthRemoteDataSourceImpl.register] Payload: ${userModel.toJson()}');

    final response = await apiService.post(
      endPoint: ApiService.registerEndpoint,
      data: userModel.toJson(),
    );

    log('📡 [ApiAuthRemoteDataSourceImpl.register] Raw response: $response');
    _saveTokenFromResponse(response);
  }

  @override
  Future<void> login(UserModel userModel) async {
    log('📡 [ApiAuthRemoteDataSourceImpl.login] Payload: ${userModel.toJson()}');

    final response = await apiService.post(
      endPoint: ApiService.loginEndpoint,
      data: userModel.toJson(),
    );

    log('📡 [ApiAuthRemoteDataSourceImpl.login] Raw response: $response');
    _saveTokenFromResponse(response);
  }
}
