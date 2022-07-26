import Link from "next/link"
import { Z_UNKNOWN } from "zlib"
import { AnimalsApi, Configuration, ProductsApi } from "../out"
import useAnimalStore, { IAnimal } from "../stores/animal-store"

interface Props {
  animals: IAnimal[]
}

export default function Animals({ animals }: Props, {errorCatched}: any) {
  const animalStore = useAnimalStore()
  return (
    <>
      <h1 className="pl-9 pt-4 text-3xl font-extrabold text-gray-900">{animals.length == 0 ? 'Dyrene kan desværre ikke vises på nuværende tidspunkt' : 'List over alle dyrene i parken'}</h1>
      <ul
        role="list"
        className="p-9 grid grid-cols-2 gap-x-4 gap-y-8 sm:grid-cols-3 sm:gap-x-6 lg:grid-cols-4 xl:gap-x-8"
      >
        {animals.map(animal => (
          <li key={animal.latinName} className="relative">
            <div className="group block w-full aspect-w-10 aspect-h-7 rounded-lg bg-gray-100 focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-offset-gray-100 focus-within:ring-indigo-500 overflow-hidden">
              <img src={animal.previewUrl} alt="" className="object-cover pointer-events-none group-hover:opacity-75" />
              <Link href={`/animal/${animal.latinName}`}>
                <button
                  type="button"
                  className="absolute inset-0 focus:outline-none"
                  onClick={() => {
                    animalStore.selectAnimal(animal)
                  }}
                >
                  <span className="sr-only">View details for {animal.displayName}</span>
                </button>
              </Link>
            </div>
            <p className="mt-2 block text-sm font-medium text-gray-900 truncate pointer-events-none">
              {animal.displayName}
            </p>
            <p className="block text-sm font-medium text-gray-500 pointer-events-none">{animal.latinName}</p>
          </li>
        ))}
      </ul>
    </>
  )
}

export async function getServerSideProps(context: any) {
  const api = new AnimalsApi(
    new Configuration({
      basePath: "https://localhost:5000"
    })
  )

  let animalsMap: IAnimal[] = []
  let errorCatched: unknown; // Might delete

  try {
    const animals = await api.getAnimals()

    animalsMap = animals.map(animal => ({
      displayName: animal.name!.displayName,
      latinName: animal.name!.latinName,
      previewUrl: animal.image!.previewUrl,
      status: animal.status!
    }))
  } catch (error) {
    errorCatched = error;
  }

  return { props: { animals: animalsMap} as Props }
}
