part of 'animals_bloc.dart';

abstract class AnimalsState extends Equatable {
  const AnimalsState();

  @override
  List<Object> get props => [];
}

class AnimalsInitial extends AnimalsState {}

class AnimalsLoading extends AnimalsState {}

class AnimalsLoaded extends AnimalsState {
  final AnimalsModel animalsModel;

  const AnimalsLoaded(this.animalsModel);

  @override
  List<Object> get props => [animalsModel];
}

class AnimalsError extends AnimalsState {
  final String message;

  const AnimalsError(this.message);
}
