import create from "zustand";
import { devtools} from "zustand/middleware";

export interface IPage {
  displayName: string;
  latinName: string;
}

interface PageState {
  selectedPage: IPage | null;
  selectPage: (page: IPage) => void;
}

const usePageStore = create<PageState>()(
  devtools((set, get) => ({
    selectedPage: null,
    selectPage: (page: IPage) => set((state) => ({
      selectedPage: page
    })),
  }))
);

export default usePageStore;
