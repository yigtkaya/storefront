import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A singleton class that manages the Dio instance for making HTTP requests.
@singleton
class DioManager {
  final Dio _dio;

  DioManager() : _dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? "", contentType: 'application/json')) {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
      ),
    );
  }

  /// Get the Dio instance.
  Dio get dio => _dio;
}
