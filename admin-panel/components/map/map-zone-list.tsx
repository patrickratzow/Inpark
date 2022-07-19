import useStore from "../../stores/map-store";

export default function MapZoneList() {
  const zones = useStore((state) => state.zones);
  const activeZoneId = useStore((state) => state.activeZoneId);
  const removeZone = useStore((state) => state.removeZone);
  const setActiveZoneId = useStore((state) => state.setActiveZoneId);
  const setZoneColor = useStore((state) => state.setZoneColor);

  const zoneItem = zones.map((z, idx) => {
    const isActive = activeZoneId === idx;
    const isOdd = idx % 2 === 1;

    return (
      <li
        className={`w-full flex flex-row justify-between items-center p-2 ${isOdd ? "bg-gray-100" : ""} ${isActive ? "bg-green-400" : ""}`}
        key={idx}
        id={`zone-${idx}`}
        onClick={() => setActiveZoneId(idx)}

      >
        <span>Zone #{idx}</span>
        <span className="flex flex-row items-center space-x-1">
          <input
            type="color"
            value={z.color}
            onChange={(e) => {
              const color = e.target.value;

              setZoneColor(idx, color);
            }}
          />
          <span onClick={() => removeZone(idx)}>X</span>
        </span>
      </li>
    );
  });

  return (
    <div>
      <ul className="w-full max-h-50">{zoneItem}</ul>
    </div>
  );
}
