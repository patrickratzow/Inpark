import useStore from "../../stores/map-store";
import Button from "../button";

export default function MapActionBar() {
    const zones = useStore((state) => state.zones);
    const zoomIn = useStore((state) => state.zoomIn);
    const zoomOut = useStore((state) => state.zoomOut);
    const addZone = useStore((state) => state.addZone);
    const clearPoints = useStore((state) => state.clearPoints);
    const clearPreviousPoint = useStore((state) => state.clearPreviousPoint);

    function exportPoints(): void {
        const zonesArr: string[] = [];
        for (const zone of zones) {
          const pointsArr: string[] = [];
    
          for (const point of zone.points) {
            const x = point.x * 100;
            const y = point.y * 100;
    
            pointsArr.push(`Point(${x}, ${y})`);
          }
          const str = `
    AnimalArea(
      color: Color(0xff${zone.color.substring(1)}),
      points: [
        ${pointsArr.join(",\n   ")}
      ]
    )`;
    
          zonesArr.push(str);
        }
    
        navigator.clipboard.writeText(zonesArr.join(",\n"));
      }

  return (
    <div className={`flex flex-row space-x-4 p-4 bg-green-600`}>
      <Button onClick={exportPoints}>Export</Button>
      <Button onClick={addZone}>New Zone</Button>
      <Button onClick={zoomIn}>Zoom in</Button>
      <Button onClick={zoomOut}>Zoom out</Button>
      <Button onClick={clearPoints}>Clear points</Button>
      <Button onClick={clearPreviousPoint}>Clear previous point</Button>
    </div>
  )
}