import "package:get_it/get_it.dart";

import "repositories/animals_repository.dart";

void setupAnimalsIoC(GetIt locator) {
  locator.registerLazySingleton<AnimalsRepository>(() => AnimalsRepository());
}
