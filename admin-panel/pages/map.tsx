import Image from "next/image";
import { MouseEvent, useEffect, useMemo, useRef, useState } from "react";
import useStore from "../stores/map-store";

interface Zone {
  color: string;
  points: Point[];
}

interface Point {
  x: number;
  y: number;
}

const svgWidth = 1009.6727;
const svgHeight = 665.96301;

export default function Map() {
  const zones = useStore(state => state.zones);
  const points = useStore(state => state.points);
  const addZone = useStore(state => state.addZone);
  const zoom = useStore(state => state.zoom);
  const activeZoneId = useStore(state => state.activeZoneId);
  const zoomIn = useStore(state => state.zoomIn);
  const zoomOut = useStore(state => state.zoomOut);
  const removePoint = useStore(state => state.removePoint);
  const createPoint = useStore(state => state.addPoint);
  const clearPoints = useStore(state => state.clearPoints);
  const clearPreviousPoint = useStore(state => state.clearPreviousPoint);

  const [size, setSize] = useState({
    width: svgWidth,
    height: svgHeight,
  });
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    setSize({
      width: svgWidth * zoom,
      height: svgHeight * zoom,
    });
  }, [zoom]);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    const width = ctx.canvas.width;
    const height = ctx.canvas.height;
    ctx.clearRect(0, 0, width, height);

    for (const zone of zones) {
      ctx.strokeStyle = zone.color;
      ctx.lineWidth = 1;

      ctx.beginPath();
      for (const point of zone.points) {
        ctx.lineTo(point.x * width, point.y * height);
      }

      ctx.stroke();
      ctx.closePath();
    }
  }, [zones, activeZoneId, size]);

  function addPoint(event: MouseEvent<HTMLCanvasElement>) {
    const canvas = canvasRef.current!;
    const rect = canvas.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;
    const screenX = x / canvas.width;
    const screenY = y / canvas.height;
    const point: Point = { x: screenX, y: screenY };

    createPoint(point);
  }

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

    console.log(zonesArr.join(",\n"));
  }

  //Top bar
  return (
    <>
      <div>
        <div
          style={{
            position: "fixed",
            zIndex: 10,
          }}
        >
          <button onClick={exportPoints}>Export</button>
          <button onClick={addZone}>New Area</button>
          <button onClick={zoomIn}>
            Zoom in
          </button>
          <button onClick={zoomOut}>
            Zoom out
          </button>
          <button onClick={clearPoints}>Clear</button>
          <button onClick={clearPreviousPoint}>Clear previous</button>
        </div>
        <div
          style={{
            position: "relative",
          }}
        >
          <Image
            style={{
              position: "absolute",
              top: 0,
              left: 0,
            }}
            src="/world.svg"
            width={size.width}
            height={size.height}
            layout="fixed"
          />
          <canvas
            style={{
              position: "absolute",
              top: 0,
              left: 0,
            }}
            width={size.width}
            height={size.height}
            ref={canvasRef}
            onClick={addPoint}
          ></canvas>
        </div>
        <div
          style={{
            position: "fixed",
            top: 0,
            right: 0,
            maxWidth: "300px",
          }}
        >
          <MapPointsList points={points()} onRemove={removePoint} />
        </div>
      </div>
      <div></div>
    </>
  );
}

interface MapPointsListProps {
  points: Point[];
  onRemove: (point: Point) => void;
}

function MapPointsList({ points, onRemove }: MapPointsListProps) {
  const pointItems = points.map((p, idx) => {
    const x = (p.x * 100).toFixed(2);
    const y = (p.y * 100).toFixed(2);

    return (
      <li key={`${x},${y}`}>
        <button onClick={() => onRemove(p)}>
          X: {x}, Y: {y}
        </button>
      </li>
    );
  });

  return <ul>{pointItems}</ul>;
}
