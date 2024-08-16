part of 'breed_detail_bloc.dart';

@immutable
sealed class BreedDetailEvent {}

final class BreedSelectedEvent extends BreedDetailEvent {
  final String breed;
  BreedSelectedEvent(this.breed);
}
