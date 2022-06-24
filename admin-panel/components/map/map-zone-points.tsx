import useStore, { Zone } from "../../stores/map-store";

export default function MapZonePoints() {
    const activeZoneId = useStore((state) => state.activeZoneId);
    const zones = useStore((state) => state.zones);
    const removePoint = useStore((state) => state.removePoint);
    const activeZone: Zone | undefined = zones[activeZoneId];
    const points = activeZone?.points ?? [];
  
    const pointItems = points.map((p, idx) => {
      const x = (p.x * 100).toFixed(2);
      const y = (p.y * 100).toFixed(2);
  
      return (
        <li key={`${x},${y}`}>
          <button onClick={() => removePoint(p)}>
            X: {x}, Y: {y}
          </button>
        </li>
      );
    });
  
    return <ul>{pointItems}</ul>;
}