part of 'breed_details_bloc.dart';

sealed class BreedDetailsEvent {}

class LoadBreedDetailsEvent implements BreedDetailsEvent {
  const LoadBreedDetailsEvent();
}

class RetryBreedDetailsEvent implements BreedDetailsEvent {
  const RetryBreedDetailsEvent();
}
