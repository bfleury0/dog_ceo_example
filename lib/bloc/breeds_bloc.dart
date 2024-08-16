import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dog_ceo_example/repositories/breeds_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  BreedsRepo breedsRespository = BreedsRepo();

  BreedsBloc(this.breedsRespository) : super(BreedsInitial()) {
    on<BreedsFetchEvent>(onBreedsFetchEvent);
  }

  FutureOr<void> onBreedsFetchEvent(
      BreedsFetchEvent event, Emitter<BreedsState> emit) async {
    emit(BreedsLoading());
    try {
      final breeds = await breedsRespository.fetchBreeds();
      emit(BreedsSuccess(breeds: breeds));
    } catch (e) {
      emit(BreedsFailure(errorMessage: e.toString()));
    }
  }
}
