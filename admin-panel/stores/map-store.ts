import create from "zustand";
import { devtools} from "zustand/middleware";

export interface Zone {
  color: string;
  points: Point[];
}

interface Point {
  x: number;
  y: number;
}

interface MapState {
  zones: Zone[];
  activeZoneId: number;
  zoom: number;
  activeZone: () => Zone;
  zoomIn: () => void;
  zoomOut: () => void;
  addZone: () => void;
  removeZone: (id: number) => void;
  setActiveZoneId: (id: number) => void;
  setZoneColor: (id: number, color: string) => void;
  addPoint: (point: Point) => void;
  removePoint: (point: Point) => void;
  clearPoints: () => void;
  clearPreviousPoint: () => void;
}

const initialZone: Zone = {
  color: "#ff0000",
  points: [],
};

const useStore = create<MapState>()(
  devtools((set, get) => ({
    zones: [initialZone],
    activeZoneId: 0,
    zoom: 1,
    activeZone: () => get().zones[get().activeZoneId],
    zoomIn: () => set((state) => ({ zoom: state.zoom + 0.33 })),
    zoomOut: () =>
      set((state) => ({ zoom: Math.max(1, state.zoom - 0.33) })),
    addZone: () =>
      set((state) => ({
        zones: [...state.zones, initialZone],
        activeZoneId: state.zones.length,
      })),
    removeZone: (id: number) =>
      set((state) => {
        const newId = Math.min(0, state.zones.length - 1);

        if (state.zones.length == 1) return {}

        return {
          zones: state.zones.filter((z, idx) => idx != id),
          activeZoneId: newId
        };
      }),
    setActiveZoneId: (id: number) =>
      set((state) => ({
        activeZoneId: id,
      })),
    setZoneColor: (id: number, color: string) =>
      set((state) => ({
        zones: state.zones.map((zone, i) =>
          i === id ? { ...zone, color } : zone
        ),
      })),
    addPoint: (point: Point) =>
      set((state) => ({
        zones: state.zones.map((zone, i) =>
          i === state.activeZoneId
            ? { ...zone, points: [...zone.points, point] }
            : zone
        ),
      })),
    removePoint: (point: Point) =>
      set((state) => ({
        zones: state.zones.map((zone, i) =>
          i === state.activeZoneId
            ? { ...zone, points: zone.points.filter((p) => p !== point) }
            : zone
        ),
      })),
    clearPoints: () =>
      set((state) => ({
        zones: state.zones.map((zone, i) =>
          i === state.activeZoneId ? { ...zone, points: [] } : zone
        ),
      })),
    clearPreviousPoint: () =>
      set((state) => ({
        zones: state.zones.map((zone, i) =>
          i === state.activeZoneId
            ? { ...zone, points: zone.points.slice(0, -1) }
            : zone
        ),
      })),
  }))
);

export default useStore;
