import 'dart:developer';

import 'package:akoun/features/island/data/model/island_model.dart';

import '../../../../../../core/services/api_service.dart';
import 'api_island_remote_data_source.dart';

class ApiIslandRemoteDataSourceImpl implements ApiIslandRemoteDataSource {
  final ApiService apiService;

  ApiIslandRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<IslandModel>> getIslandList() async {
    final responseData = await apiService.get(
      endPoint: ApiService.islandEndpoint,
    );

    // Safely extract the list from responseData['data'] map
    final List<dynamic> rawList = responseData is Map<String, dynamic>
        ? (responseData['data'] as List<dynamic>? ?? [])
        : (responseData as List<dynamic>? ?? []);

    log('📡 [ApiIslandRemoteDataSourceImpl] Raw response list length: ${rawList.length}');

    return rawList
        .map((json) => IslandModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
