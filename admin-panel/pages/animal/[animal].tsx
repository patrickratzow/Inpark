import Link from 'next/link';
import { useRouter } from 'next/router'
import Button from '../../components/button';

//This should be the Animals name;
const Animal = () => {
    const router = useRouter();
    const {animal} = router.query;

    return(
        <>
        <div className='min-h-screen pl-8 pt-4'>        
            <Button onClick={() => router.back()}>Gå tilbage til dyre oversigten</Button> 
            <div className='flex relative justify-center'>
                <p>Dyr: {animal}</p>
                {//animal/id/map
                }
                <Link href={`/animal/${animal}/map`}>
                    <Button onClick={() => {}}>
                        Ændrer kort for dyret
                    </Button>
                </Link>
            </div>  
        </div>        
        </>
    )
}

export default Animal;
