import Link from 'next/link';
import { useRouter } from 'next/router'
import { useEffect, useState } from 'react';
import Button from '../../components/button';
import { AnimalsApi, Configuration, GetAnimalRequest, ZooInparkEntitiesAnimal } from '../../out';
import useAnimalStore, { IAnimal } from '../../stores/animal-store';


//This should be the Animals name;
export default function AnimalPage() {
    const router = useRouter();
    const {animal} = router.query;
    const animalStore = useAnimalStore();

    useEffect(() => {
        //Call API and set value
        const api = new AnimalsApi(
            new Configuration({
              basePath: "https://localhost:5000"
            })
          );

          if(animal !== undefined){
            const animalName: GetAnimalRequest = {
                latinName: animal as string
            }
                const fetchAnimal = async()=> {
                    const foundAnimal = await api.getAnimal(animalName);
                    const animalObject: IAnimal = {
                        displayName: foundAnimal.name?.name as string,
                        latinName: foundAnimal.name?.latinName as string
                    }
                    animalStore.selectAnimal(animalObject);
                    console.log(foundAnimal);
                };
                fetchAnimal();
            }
        
    }, [animal]);

    return(
        <>
        <div className='min-h-screen pl-8 pt-4'>        
        <Link href={`/animals`}>
                    <Button onClick={() => {}}>
                        Gå tilbage til dyreoversigten
                    </Button>
                </Link>
            <div className='flex relative justify-center'>
                <p>Dyr: {animalStore.selectedAnimal?.displayName}</p>
                <Link href={`/animal/${animalStore.selectedAnimal?.latinName}/map`}>
                    <Button onClick={() => {}}>
                        Ændrer kort for dyret
                    </Button>
                </Link>
            </div>  
        </div>        
        </>
    )
}

