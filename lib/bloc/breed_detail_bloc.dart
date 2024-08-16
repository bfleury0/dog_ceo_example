import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dog_ceo_example/repositories/breeds_repo.dart';
import 'package:flutter/material.dart';

part 'breed_detail_event.dart';
part 'breed_detail_state.dart';

class BreedDetailBloc extends Bloc<BreedDetailEvent, BreedDetailState> {
  BreedsRepo breedsRespository = BreedsRepo();

  BreedDetailBloc(this.breedsRespository) : super(BreedDetailInitial()) {
    on<BreedSelectedEvent>(onBreedSelectedEvent);
  }

  FutureOr<void> onBreedSelectedEvent(
      BreedSelectedEvent event, Emitter<BreedDetailState> emit) async {
    emit(BreedDetailLoading());

    try {
      final breed = event.breed;
      final image = await breedsRespository.fetchBreedImage(breed);
      emit(BreedDetailSuccess(breed: breed, image: image));
    } catch (e) {
      emit(BreedDetailsFailure(errorMessage: e.toString()));
    }
  }
}
