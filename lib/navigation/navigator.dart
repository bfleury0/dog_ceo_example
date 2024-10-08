import 'package:dog_ceo_example/navigation/router/router.dart';
import 'package:injectable/injectable.dart';

@injectable
class DogCeoNavigator {
  const DogCeoNavigator(this._router);

  final DogCeoRouter _router;

  Future<void> goToBreedDetails(String breedId) =>
      _router.pushNamed('/breedDetail/$breedId');
}
