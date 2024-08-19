import 'package:dog_ceo_example/domain/api/api.dart';
import 'package:dog_ceo_example/domain/model/breed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'breed_details_event.dart';
part 'breed_details_state.dart';

@injectable
class BreedDetailsBloc extends Bloc<BreedDetailsEvent, BreedDetailsState> {
  BreedDetailsBloc(
    this._api,
    @factoryParam this._breedId,
  ) : super(const InitialBreedDetailsState()) {
    on<BreedDetailsEvent>(
      (event, emit) => switch (event) {
        LoadBreedDetailsEvent() => _onLoad(event, emit),
        RetryBreedDetailsEvent() => _onRetry(event, emit),
      },
    );

    add(const LoadBreedDetailsEvent());
  }

  final DogBreedApi _api;
  final String _breedId;

  Future<void> _onLoad(
    LoadBreedDetailsEvent event,
    Emitter<BreedDetailsState> emit,
  ) async {
    if (state is LoadingBreedDetailsState) {
      return;
    }

    emit(const LoadingBreedDetailsState());

    try {
      final breed = await _api.getBreed(_breedId);
      emit(ContentBreedDetailsState(breeds: breed));
    } on Exception {
      emit(const ErrorBreedDetailsState());
    }
  }

  Future<void> _onRetry(
    RetryBreedDetailsEvent event,
    Emitter<BreedDetailsState> emit,
  ) async {
    add(const LoadBreedDetailsEvent());
  }
}
