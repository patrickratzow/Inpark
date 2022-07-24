import { useRouter } from "next/router"
import { useEffect, useState } from "react"
import { AnimalsApi, Configuration, SetAnimalAreaRequest, ZooInparkContractsAnimalAreaDto } from "../../out"
import useAnimalStore from "../../stores/animal-store"
import useStore from "../../stores/map-store"
import Button from "../button"

export default function MapActionBar() {
  const zones = useStore(state => state.zones)
  const zoomIn = useStore(state => state.zoomIn)
  const zoomOut = useStore(state => state.zoomOut)
  const addZone = useStore(state => state.addZone)
  const clearPoints = useStore(state => state.clearPoints)
  const clearPreviousPoint = useStore(state => state.clearPreviousPoint)
  const [animalName, setAnimalName] = useState("")
  const router = useRouter();
  const {animal} = router.query; //To delete?
  const animalStore = useAnimalStore();

  useEffect(() =>{
    if(animalStore.selectedAnimal === null){
      setAnimalName(animal as string);
    } else {
      setAnimalName(animalStore.selectedAnimal!.latinName);
    }

  }, [animal]);

  //Export should send the exported points list to the API.
  async function saveMap(): Promise<void> {
    const api = new AnimalsApi(
      new Configuration({
        basePath: "https://localhost:5000"
      })
    )
    const zonesArr: ZooInparkContractsAnimalAreaDto[] = []
    for (const zone of zones) {
      const color = zone.color.substring(1)
      const zoneDto: ZooInparkContractsAnimalAreaDto = {
        color: color,
        points: []
      }
      for (const point of zone.points) {
        const x = point.x * 100
        const y = point.y * 100

        zoneDto.points.push(x)
        zoneDto.points.push(y)
      }

      zonesArr.push(zoneDto)
    }

    const animalRequest: SetAnimalAreaRequest = { latinName: animalName, zooInparkContractsAnimalAreaDto: zonesArr }
    await api.setAnimalArea(animalRequest)
  }

  return (
    <div className={`flex flex-row space-x-4 p-4 bg-gray-900`}>
      <Button onClick={saveMap}>Export</Button>
      <div>
        <input
          type="text"
          value={animalName}
          className="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
          onChange={e => setAnimalName(e.target.value)}
          placeholder={`${animalName}`}
          readOnly
        />
      </div>
      <Button onClick={addZone}>New Zone</Button>
      <Button onClick={zoomIn}>Zoom in</Button>
      <Button onClick={zoomOut}>Zoom out</Button>
      <Button onClick={clearPoints}>Clear points</Button>
      <Button onClick={clearPreviousPoint}>Clear previous point</Button>
    </div>
  )
}