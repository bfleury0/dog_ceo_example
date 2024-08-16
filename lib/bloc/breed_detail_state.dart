part of 'breed_detail_bloc.dart';

@immutable
sealed class BreedDetailState {}

final class BreedDetailInitial extends BreedDetailState {}

final class BreedDetailLoading extends BreedDetailState {}

final class BreedDetailSuccess extends BreedDetailState {
  final String breed;
  final String image;

  BreedDetailSuccess({required this.breed, required this.image});
}

final class BreedDetailsFailure extends BreedDetailState {
  final String errorMessage;

  BreedDetailsFailure({
    required this.errorMessage,
  });
}
