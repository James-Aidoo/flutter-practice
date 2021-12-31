import 'package:dio/dio.dart';

class RemoteDataClient {
  ///
  /// Add global headers here
  ///
  static const _headers = {'': ''};

  static BaseOptions get _options => BaseOptions(
        baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/',
        connectTimeout: 30000,
        followRedirects: true,
        headers: _headers,
      );

  final _dio = Dio(_options);

  Dio get dio {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    return _dio;
  }
}
