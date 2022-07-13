import create from "zustand";
import { devtools} from "zustand/middleware";

export interface IAnimal {
  displayName: string;
  latinName: string;
}

interface AnimalState {
  selectedAnimal: IAnimal | null;
  selectAnimal: (animal: IAnimal) => void;
}

const useAnimalStore = create<AnimalState>()(
  devtools((set, get) => ({
    selectedAnimal: null,
    selectAnimal: (animal: IAnimal) => set(() => ({
      selectedAnimal: animal
    })),
  }))
);

export default useAnimalStore;
