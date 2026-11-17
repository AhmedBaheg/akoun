import 'dart:developer';
import 'dart:math' as math;
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://akon.fassla.net/api/v1';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String islandEndpoint = '/icelands';
  static const String profileEndpoint = '/profile';

  /// Static global session token saved upon successful login/register
  static String? userToken;

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
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    log('🌐 [ApiService.post] Request URL: $baseUrl$endPoint');
    log('🌐 [ApiService.post] Request Payload: $data');

    final String? authToken = token ?? userToken;
    final requestOptions = options ?? Options();

    if (authToken != null && authToken.isNotEmpty) {
      requestOptions.headers = {
        ...?requestOptions.headers,
        'Authorization': 'Bearer $authToken',
      };
      log('🔑 [ApiService.post] Bearer Token Attached: ${authToken.substring(0, math.min(10, authToken.length))}...');
    }

    try {
      final response = await _dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
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

  Future<dynamic> get({
    required String endPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    log('🌐 [ApiService.get] Request URL: $baseUrl$endPoint');

    final String? authToken = token ?? userToken;
    final requestOptions = options ?? Options();

    if (authToken != null && authToken.isNotEmpty) {
      requestOptions.headers = {
        ...?requestOptions.headers,
        'Authorization': 'Bearer $authToken',
      };
      log('🔑 [ApiService.get] Bearer Token Attached: ${authToken.substring(0, math.min(10, authToken.length))}...');
    } else {
      log('⚠️ [ApiService.get] WARNING: No Bearer Token attached for $endPoint!');
    }

    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: requestOptions,
      );

      log('✅ [ApiService.get] Status Code: ${response.statusCode}');
      log('✅ [ApiService.get] Response Data: ${response.data}');

      return response.data;
    } on DioException catch (e) {
      log('❌ [ApiService.get] DioException Status Code: ${e.response?.statusCode}');
      log('❌ [ApiService.get] DioException Data: ${e.response?.data}');
      log('❌ [ApiService.get] DioException Error: ${e.message}');
      rethrow;
    } catch (e) {
      log('❌ [ApiService.get] Exception: $e');
      rethrow;
    }
  }
}
