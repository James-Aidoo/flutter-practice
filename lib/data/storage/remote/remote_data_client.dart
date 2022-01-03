import 'package:dio/dio.dart';

class RemoteDataClient {
  static const baseUrl = 'http://mark.bslmeiyu.com/api/';

  ///
  /// Add global headers here
  ///
  static const _headers = {'': ''};

  static BaseOptions get _options => BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 30000,
        followRedirects: true,
        headers: _headers,
      );

  static final _dio = Dio(_options);

  static Dio get dio {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    return _dio;
  }
}
