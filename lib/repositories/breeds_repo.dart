import 'package:dog_ceo_example/data/dio_client.dart';

class BreedsRepo {
  final client = DioClient();

  Future<List<String>> fetchBreeds() async {
    List<String> breeds = [];
    try {
      final response = await client.dio.get('api/breeds/list/all');

      response.data['message'].forEach((breed, subbreed) {
        breeds.add(breed);
      });
      return breeds;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> fetchBreedImage(String breed) async {
    try {
      final response = await client.dio.get('api/breed/$breed/images/random');
      final image = response.data['message'];
      return image;
    } catch (e) {
      rethrow;
    }
  }
}
