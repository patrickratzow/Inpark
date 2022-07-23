import Link from "next/link"
import Button from "../components/button"
import { AnimalsApi, Configuration } from "../out"

interface Animal {
  name: string
}

interface Props {
  animals: Animal[]
}

export default function Animals({ animals }: Props) {
  //List of animals, with
  return (
    <>
      <div>
        <p>Det her viser alle dyrene i parken!</p>
        <ul>
          {animals.map(animal => (
            //We also want the route to be with the animal?
            //Or just a store saving the clicked animal?
            <Link href={"/map"}>            
            <Button
              onClick={() => {
                console.log(animal.name);
              }}
            >
              <li key={animal.name}>{animal.name}</li>
            </Button>
            </Link>

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

  const animalsMap: Animal[] = animals.map(animal => ({ name: animal.name!.displayName }))

  return { props: { animals: animalsMap } as Props }
}