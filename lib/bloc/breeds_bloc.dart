import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dog_ceo_example/data/dio_client.dart';
import 'package:flutter/material.dart';

part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  BreedsBloc() : super(BreedsInitial()) {
    on<BreedsFetchEvent>(onBreedsFetchEvent);
  }

  FutureOr<void> onBreedsFetchEvent(
      BreedsFetchEvent event, Emitter<BreedsState> emit) async {
    emit(BreedsLoading());
    try {
      var client = DioClient();
      await client.dio.get('api/breeds/list/all').then((value) {
        List<String> breeds = [];
        value.data['message'].forEach((breed, subbreed) {
          breeds.add(breed);
        });

        emit(BreedsSuccess(breeds: breeds));
      }).catchError((error) {
        emit(BreedsFailure(errorMessage: error.toString()));
      });
    } catch (e) {
      emit(BreedsFailure(errorMessage: e.toString()));
    }
  }
}
