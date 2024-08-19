import 'package:dio/dio.dart';

class DogCeoFailureInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.reject(DioException(requestOptions: options));
  }
}
