import 'dart:developer';

import 'package:akoun/core/network/result.dart';
import 'package:akoun/features/island/domain/entity/island_entity.dart';
import 'package:akoun/features/island/domain/repo/island_repo.dart';
import 'package:dio/dio.dart';

import '../data_source/remote/island/api_island_remote_data_source.dart';

class IslandRepoImpl implements IslandRepo {
  final ApiIslandRemoteDataSource apiIslandRemoteDataSource;

  IslandRepoImpl({required this.apiIslandRemoteDataSource});

  @override
  Future<Result<List<IslandEntity>>> getIslandList() async {
    try {
      final islandList = await apiIslandRemoteDataSource.getIslandList();
      log('🏢 [IslandRepoImpl] Retrieved islandList length: ${islandList.length}');

      final entityList =
          islandList.map((islandModel) => islandModel.toEntity()).toList();
      return Success(data: entityList);
    } on DioException catch (e) {
      log('❌ [IslandRepoImpl] DioException: ${e.response?.statusCode} - ${e.response?.data}');
      final serverMessage = e.response?.data is Map<String, dynamic>
          ? e.response?.data['message'] as String?
          : null;
      return Failure(
        errorMessage: serverMessage ?? 'حدث خطأ في الاتصال، يرجى المحاولة لاحقاً',
      );
    } catch (e) {
      log('❌ [IslandRepoImpl] Exception: $e');
      return Failure(errorMessage: e.toString());
    }
  }
}
