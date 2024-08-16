import 'package:bloc_test/bloc_test.dart';
import 'package:dog_ceo_example/bloc/breed_detail_bloc.dart';
import 'package:dog_ceo_example/bloc/breeds_bloc.dart';
import 'package:dog_ceo_example/repositories/breeds_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBreedsRepo extends Mock implements BreedsRepo {}

void main() {
  group('BreedsBloc', () {
    late MockBreedsRepo mockBreedsRepo = MockBreedsRepo();

    setUp(() {
      mockBreedsRepo = MockBreedsRepo();
    });

    test('initial state is breeds loading', () {
      expect(BreedsBloc(mockBreedsRepo).state, BreedsLoading());
    });

    blocTest<BreedsBloc, BreedsState>(
      'emits [ BreedsLoading,BreedsFailure ] when loading fails',
      setUp: () => when(mockBreedsRepo.fetchBreeds).thenThrow('Exception'),
      build: () => BreedsBloc(mockBreedsRepo),
      act: (bloc) => bloc.add(BreedsFetchEvent()),
      expect: () => <BreedsState>[
        BreedsLoading(),
        BreedsFailure(errorMessage: 'Exception')
      ],
      verify: (_) => verify(mockBreedsRepo.fetchBreeds).called(1),
    );
  });
}
