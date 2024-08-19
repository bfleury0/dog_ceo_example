import 'package:dio/dio.dart';
import 'package:dog_ceo_example/constants/app_constants.dart'
    show dogBreedsBaseUrlNamed;
import 'package:dog_ceo_example/util/dio_setup.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DIApiModule {
  @lazySingleton
  Dio createDio() => Dio()..setUpForDemo();

  @prod
  @dev
  @Named(dogBreedsBaseUrlNamed)
  String get baseUrl => 'https://dog.ceo';

  @test
  @Named(dogBreedsBaseUrlNamed)
  String get testBaseUrl => 'https://mock';
}
