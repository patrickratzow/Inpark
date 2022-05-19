import create from "zustand";
import { devtools, persist } from "zustand/middleware";

interface Zone {
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
  points: () => Point[];
  activeZone: () => Zone;
  zoomIn: () => void;
  zoomOut: () => void;
  addZone: () => void;
  removeZone: (id: number) => void;
  setZoneColor: (color: string) => void;
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
  devtools(
    persist((set, get) => ({
      zones: [initialZone],
      activeZoneId: 0,
      zoom: 1,
      points: () => get().zones[get().activeZoneId].points,
      activeZone: () => get().zones[get().activeZoneId],
      zoomIn: () => set((state) => ({ zoom: state.zoom + 0.33 })),
      zoomOut: () =>
        set((state) => ({ zoom: Math.max(0.33, state.zoom - 0.33) })),
      addZone: () =>
        set((state) => ({
          zones: [...state.zones, initialZone],
          activeZoneId: state.zones.length,
        })),
      removeZone: (id: number) =>
        set((state) => ({
          zones: state.zones.slice(id, -1),
          activeZoneId: id == 0 ? id + 1 : id - 1,
        })),
      setZoneColor: (color: string) =>
        set((state) => ({
          zones: state.zones.map((zone, i) =>
            i === state.activeZoneId ? { ...zone, color } : zone
          ),
        })),
      addPoint: (point: Point) =>
        set((state) => ({
          zones: state.zones.map((zone, i) =>
            i === state.activeZoneId ? { ...zone, points: [...zone.points, point] } : zone
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
            i === state.activeZoneId  ? { ...zone, points: [] } : zone
          ),
        })),
      clearPreviousPoint: () =>
        set((state) => ({
          zones: state.zones.map((zone, i) =>
            i === state.activeZoneId 
              ? { ...zone, points: zone.points.slice(1) }
              : zone
          ),
        })),

    }))
  )
);

export default useStore;
