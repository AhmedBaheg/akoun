import 'dart:developer';

import 'package:akoun/core/services/api_service.dart';
import 'package:akoun/features/auth/data/model/user_model.dart';

import 'api_auth_remote_data_source.dart';

class ApiAuthRemoteDataSourceImpl implements ApiAuthRemoteDataSource {
  final ApiService apiService;

  ApiAuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> register(UserModel userModel) async {
    log('📡 [ApiAuthRemoteDataSourceImpl.register] Payload: ${userModel.toJson()}');

    final response = await apiService.post(
      endPoint: ApiService.registerEndpoint,
      data: userModel.toJson(),
    );

    log('📡 [ApiAuthRemoteDataSourceImpl.register] Raw response: $response');
  }

  @override
  Future<void> login(UserModel userModel) async{
    log('📡 [ApiAuthRemoteDataSourceImpl.login] Payload: ${userModel.toJson()}');
    final response = await apiService.post(
      endPoint: ApiService.loginEndpoint,
      data: userModel.toJson(),
    );
    log('📡 [ApiAuthRemoteDataSourceImpl.login] Raw response: $response');
  }
}
