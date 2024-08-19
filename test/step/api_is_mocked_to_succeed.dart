import 'package:dio/dio.dart';
import 'package:dog_ceo_example/di/di_container.dart';
import 'package:dog_ceo_example/domain/api/data/data_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> apiIsMockedToSucceed(WidgetTester tester) async {
  final interceptors = diContainer<Dio>().interceptors;
  interceptors.clear();
  interceptors.add(DogCeoDataInterceptor());
}
