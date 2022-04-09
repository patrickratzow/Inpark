import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/common/ioc.dart';
import 'package:flutter_app/features/animals/models/animals_model.dart';
import 'package:flutter_app/features/animals/repositories/animals_repository.dart';

part 'animals_event.dart';
part 'animals_state.dart';

class AnimalsBloc extends Bloc<AnimalsEvent, AnimalsState> {
  AnimalsBloc() : super(AnimalsInitial()) {
    final animalsRepository = locator.get<AnimalsRepository>();

    on<GetAnimals>((event, emit) async {
      try {
        emit(AnimalsLoading());

        var animalsResult = await animalsRepository.fetchAnimals();
        if (animalsResult.isSuccess) {
          emit(AnimalsLoaded(animalsResult.success!));
        } else {
          emit(AnimalsError(animalsResult.error!));
        }
      } catch (ex) {
        emit(AnimalsError(ex.toString()));
      }
    });
  }
}
