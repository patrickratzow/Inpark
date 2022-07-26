import create from "zustand";
import { devtools} from "zustand/middleware";
import { ZooInparkContractsIUCNStatusDto, ZooInparkEntitiesIUCNStatus } from "../out";

export interface IAnimal {
  displayName: string;
  latinName: string;
  previewUrl: string
  status: ZooInparkEntitiesIUCNStatus | ZooInparkContractsIUCNStatusDto
}

const statusMap = new Map();

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
