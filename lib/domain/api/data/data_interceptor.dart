import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dog_ceo_example/domain/api/data/breeds_list.dart';

class DogCeoDataInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final uri = Uri.parse(options.path);
    if (uri.pathSegments.isNotEmpty && uri.pathSegments.last == 'all') {
      return handler.resolve(
        Response(
          requestOptions: options,
          data: jsonDecode(breedsListJsonString),
        ),
      );
    }

    super.onRequest(options, handler);
  }
}
