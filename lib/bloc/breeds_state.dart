part of 'breeds_bloc.dart';

@immutable
sealed class BreedsState extends Equatable {}

final class BreedsInitial extends BreedsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class BreedsLoading extends BreedsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class BreedsSuccess extends BreedsState {
  final List<String> breeds;

  BreedsSuccess({required this.breeds});

  @override
  // TODO: implement props
  List<Object?> get props => [breeds];
}

final class BreedsFailure extends BreedsState {
  final String errorMessage;

  BreedsFailure({
    required this.errorMessage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
