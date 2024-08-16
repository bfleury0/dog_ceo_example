part of 'breeds_bloc.dart';

@immutable
sealed class BreedsEvent {}

final class BreedsFetchEvent extends BreedsEvent {}
