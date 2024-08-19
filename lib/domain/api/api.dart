import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:dio/dio.dart';
import 'package:dog_ceo_example/constants/app_constants.dart'
    show dogBreedsBaseUrlNamed;
import 'package:dog_ceo_example/domain/model/breed.dart';
import 'package:dog_ceo_example/domain/model/breeds.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@includeInBarrelFile
@injectable
@RestApi()
abstract class DogBreedApi {
  @factoryMethod
  factory DogBreedApi(
    Dio dio, {
    @Named(dogBreedsBaseUrlNamed) String baseUrl,
  }) = _DogBreedApi;

  @GET('/api/breeds/list/all')
  Future<Breeds> getBreeds();

  @GET('/api/breed/{breedId}/images')
  Future<Breed> getBreed(@Path('breedId') String breedId);
}
