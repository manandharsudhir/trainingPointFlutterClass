import 'package:dio/dio.dart';

class BaseClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.nstack.in/v1',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: "application/json",
      responseType: ResponseType.json,
      headers: {"accept": "application/json"},
    ),
  );
  static BaseClient get instance => BaseClient._();

  BaseClient._();

  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
