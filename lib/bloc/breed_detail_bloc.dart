import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dog_ceo_example/data/dio_client.dart';
import 'package:flutter/material.dart';

part 'breed_detail_event.dart';
part 'breed_detail_state.dart';

class BreedDetailBloc extends Bloc<BreedDetailEvent, BreedDetailState> {
  BreedDetailBloc() : super(BreedDetailInitial()) {
    on<BreedSelectedEvent>(onBreedSelectedEvent);
  }

  FutureOr<void> onBreedSelectedEvent(
      BreedSelectedEvent event, Emitter<BreedDetailState> emit) async {
    emit(BreedDetailLoading());
    try {
      final breed = event.breed;
      var client = DioClient();
      await client.dio.get('api/breed/$breed/images/random').then((value) {
        final image = value.data['message'];
        emit(BreedDetailSuccess(breed: breed, image: image));
      }).catchError((error) {
        emit(BreedDetailsFailure(errorMessage: error.toString()));
      });
    } catch (e) {
      emit(BreedDetailsFailure(errorMessage: e.toString()));
    }
  }
}
