import Image from "next/image"
import { MouseEvent, useEffect, useMemo, useRef, useState } from "react"
import useStore from "../../stores/map-store"

interface Point {
  x: number
  y: number
}

const svgWidth = 1009.6727 * 1.312;
const svgHeight = 665.96301 * 1.312;

export default function MapCanvas() {
  const zones = useStore(state => state.zones)
  const zoom = useStore(state => state.zoom)
  const activeZoneId = useStore(state => state.activeZoneId)
  const createPoint = useStore(state => state.addPoint)

  const [size, setSize] = useState({
    width: svgWidth,
    height: svgHeight
  })

  useEffect(() => {
    setSize({
      width: svgWidth * zoom,
      height: svgHeight * zoom
    })
  }, [zoom])

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return
    const ctx = canvas.getContext("2d")
    if (!ctx) return

    const width = ctx.canvas.width
    const height = ctx.canvas.height
    ctx.clearRect(0, 0, width, height)

    for (const zone of zones) {
      ctx.strokeStyle = zone.color
      ctx.lineWidth = 1

      ctx.beginPath()
      for (const point of zone.points) {
        ctx.lineTo(point.x * width, point.y * height)
      }

      ctx.stroke()
      ctx.closePath()
    }
  }, [zones, activeZoneId, size])

  const canvasRef = useRef<HTMLCanvasElement>(null)

  function addPoint(event: MouseEvent<HTMLCanvasElement>) {
    const canvas = canvasRef.current!
    const rect = canvas.getBoundingClientRect()
    const x = event.clientX - rect.left
    const y = event.clientY - rect.top
    const screenX = x / canvas.width
    const screenY = y / canvas.height
    const point: Point = { x: screenX, y: screenY }

    createPoint(point)
  }
  return (
    <>
      <div
        style={{
          position: "relative",
          overflow: "scroll",
          height: svgHeight,
          width: svgWidth
        }}
      >
        <Image
          style={{
            position: "absolute",
            top: 0,
            left: 0
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
            left: 0
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
          maxWidth: "300px"
        }}
      ></div>
    </>
  )
}
