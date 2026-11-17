import 'dart:developer';

import 'package:akoun/core/services/api_service.dart';
import 'package:akoun/features/island/data/model/child_model.dart';
import 'api_profile_remote_data_source.dart';

class ApiProfileRemoteDataSourceImpl implements ApiProfileRemoteDataSource {
  final ApiService apiService;

  ApiProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ChildModel> getChildProfile() async {
    log('📡 [ApiProfileRemoteDataSourceImpl.getChildProfile] Fetching child child...');

    final response = await apiService.get(
      endPoint: ApiService.profileEndpoint,
    );

    log('📡 [ApiProfileRemoteDataSourceImpl.getChildProfile] Raw response: $response');

    if (response is Map<String, dynamic>) {
      final data = response['data'] as Map<String, dynamic>?;
      final childrenList = data?['children'] as List<dynamic>?;

      if (childrenList != null && childrenList.isNotEmpty) {
        final childJson = childrenList.first as Map<String, dynamic>;
        log('👤 [ApiProfileRemoteDataSourceImpl.getChildProfile] Found child child: $childJson');
        return ChildModel.fromJson(childJson);
      }

      if (data != null) {
        return ChildModel.fromJson(data);
      }
    }

    throw Exception('لم يتم العثور على بيانات الطفل');
  }
}
