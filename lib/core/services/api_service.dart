import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://akon.fassla.net/api/v1';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';

  final Dio _dio;

  ApiService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          );

  Future<dynamic> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    log('🌐 [ApiService.post] Request URL: $baseUrl$endPoint');
    log('🌐 [ApiService.post] Request Payload: $data');

    try {
      final response = await _dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      log('✅ [ApiService.post] Status Code: ${response.statusCode}');
      log('✅ [ApiService.post] Response Data: ${response.data}');

      return response.data;
    } on DioException catch (e) {
      log('❌ [ApiService.post] DioException Status Code: ${e.response?.statusCode}');
      log('❌ [ApiService.post] DioException Data: ${e.response?.data}');
      log('❌ [ApiService.post] DioException Error: ${e.message}');
      rethrow;
    } catch (e) {
      log('❌ [ApiService.post] Exception: $e');
      rethrow;
    }
  }
}
