import create from "zustand";
import { devtools} from "zustand/middleware";

export interface Animal {
}

interface AnimalState {
  
}


const useStore = create<AnimalState>()(
  devtools((set, get) => ({
  }))
);

export default useStore;
