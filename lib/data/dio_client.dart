import 'package:dio/dio.dart';

class DioClient {
  static const String _baseUrl = "https://dog.ceo/";

  final Dio dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );
}
