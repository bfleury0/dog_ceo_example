part of 'breeds_bloc.dart';

@immutable
sealed class BreedsState {}

final class BreedsInitial extends BreedsState {}

final class BreedsLoading extends BreedsState {}

final class BreedsSuccess extends BreedsState {
  final List<String> breeds;

  BreedsSuccess({required this.breeds});
}

final class BreedsFailure extends BreedsState {
  final String errorMessage;

  BreedsFailure({
    required this.errorMessage,
  });
}
