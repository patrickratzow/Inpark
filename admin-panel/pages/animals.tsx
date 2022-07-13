import Link from "next/link"
import Button from "../components/button"
import { AnimalsApi, Configuration, ProductsApi } from "../out"
import useAnimalStore, { IAnimal } from "../stores/animal-store"

interface Props {
  animals: IAnimal[]
}

export default function Animals({ animals }: Props) {
  const animalStore = useAnimalStore()
  //List of animals, with
  return (
    <>
      <div className="min-h-screen pl-8">
        <p className="text-center pt-4">Det her viser alle dyrene i parken!</p>
        <ul>
          {animals.map(animal => (
            //We also want the route to be with the animal?
            //Or just a store saving the clicked animal?
            <li className="pb-4">
              <Link href={`/animal/${animal.latinName}`}>
                <Button
                  onClick={() => {
                    animalStore.selectAnimal(animal)
                  }}
                >
                  <li key={animal.latinName}>
                    {animal.displayName} ({animal.latinName})
                  </li>
                </Button>
              </Link>
            </li>
          ))}
        </ul>
      </div>
    </>
  )
}

export async function getServerSideProps(context: any) {
  const api = new AnimalsApi(
    new Configuration({
      basePath: "https://localhost:5000"
    })
  )
  const animals = await api.getAnimals()

  const animalsMap: IAnimal[] = animals.map(animal => ({
    displayName: animal.name!.displayName,
    latinName: animal.name!.latinName
  }))

  return { props: { animals: animalsMap } as Props }
}
