import 'package:dio/dio.dart';

class RemoteDataClient {
  static const baseUrl = 'http://mark.bslmeiyu.com/api/';
  static const baseImageUrl = 'http://mark.bslmeiyu.com/uploads';

  ///
  /// Add global headers here
  ///
  static const _headers = <String, dynamic>{};

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
