import { Prop } from "vue/types/options"
import Button from "../components/button"
import { Configuration } from "../out"
import { AnimalsApi } from "../out/apis/AnimalsApi"

interface Animal{
    name: string,
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
            <li key={animal.name}>{animal.name}</li>
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