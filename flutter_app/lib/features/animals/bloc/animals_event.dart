part of 'animals_bloc.dart';

abstract class AnimalsEvent extends Equatable {
  const AnimalsEvent();

  @override
  List<Object> get props => [];
}

class GetAnimals extends AnimalsEvent {}

class UpdateSearch extends AnimalsEvent {
  final String search;
  const UpdateSearch(this.search);

  @override
  List<Object> get props => [search];
}
