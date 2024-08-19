import 'package:dog_ceo_example/domain/api/api.dart';
import 'package:dog_ceo_example/domain/model/breeds.dart';
import 'package:dog_ceo_example/navigation/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'breeds_list_event.dart';
part 'breeds_list_state.dart';

@injectable
class BreedsListBloc extends Bloc<BreedsListEvent, BreedsListState> {
  BreedsListBloc(
    this._api,
    this._navigator,
    @factoryParam this._launchId,
  ) : super(const InitialBreedsListState()) {
    on<BreedsListEvent>(
      (event, emit) => switch (event) {
        LoadBreedsListEvent() => _onLoad(event, emit),
        RetryBreedsListEvent() => _onRetry(event, emit),
        OpenDetailsBreedsListEvent() => _onOpenDetails(event, emit),
      },
    );

    add(const LoadBreedsListEvent());
  }

  final DogBreedApi _api;
  final DogCeoNavigator _navigator;

  final String? _launchId;

  Future<void> _onLoad(
    LoadBreedsListEvent event,
    Emitter<BreedsListState> emit,
  ) async {
    if (state is LoadingBreedsListState) {
      return;
    }

    emit(const LoadingBreedsListState());

    try {
      final breeds = await _api.getBreeds();
      emit(ContentBreedsListState(breeds: breeds));
    } on Exception {
      emit(const ErrorBreedsListState());
    }
  }

  Future<void> _onRetry(
    RetryBreedsListEvent event,
    Emitter<BreedsListState> emit,
  ) async {
    add(const LoadBreedsListEvent());
  }

  Future<void> _onOpenDetails(
    OpenDetailsBreedsListEvent event,
    Emitter<BreedsListState> emit,
  ) async {
    await _navigator.goToBreedDetails(event.breedId);
  }
}
