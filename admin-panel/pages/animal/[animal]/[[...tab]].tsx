import { useRouter } from "next/router"
import { useEffect, useState } from "react"
import { AnimalsApi, Configuration, GetAnimalRequest, ZooInparkContractsIUCNStatusDto, ZooInparkEntitiesAnimal, ZooInparkEntitiesIUCNStatus } from "../../../out"
import useAnimalStore, { IAnimal } from "../../../stores/animal-store"
import Map from "../../../pages/animal/[animal]/map"
import InformationTab from "../../../components/tabs/animal/information"

interface Tab {
  name: string
  href: string
  render: () => JSX.Element
}

function Foo(name: string) {
  return <h1>{name}</h1>
}


//This should be the Animals name;
export default function AnimalPage() {
  const tabs: Tab[] = [
    { name: "Information", href: "information", render: () => InformationTab() },
    { name: "Oversigt", href: "oversigt", render: () => Foo("Ændre fakta om dyret") },
    { name: "Kort", href: "kort", render: () => Map() },
    { name: "Sjove fakta", href: "sjove-fakts", render: () => Foo("Sjove fakta") }
  ]
  const router = useRouter()
  const { animal } = router.query
  const animalStore = useAnimalStore()
  const [activeTab, setActiveTab] = useState(router.query.tab ?? tabs[0].href)

  function isActiveTab(tab: Tab) {
    return tab.href == activeTab
  }

  function changeTab(tab: string) {
    router.push(
      { query: { animal: animalStore.selectedAnimal?.latinName, tab } },
      `/animal/${animalStore.selectedAnimal?.latinName}/${tab}`,
      { shallow: true }
    )
  }

  function classNames(...classes: any) {
    return classes.filter(Boolean).join(" ")
  }

  useEffect(() => {
    const tab = tabs.find(n => n.href == router.query.tab)

    if (tab == undefined) {
      setActiveTab(tabs[0].href)
      return;
    }

    setActiveTab(tab.href)
  }, [router.query.tab])

  useEffect(() => {
    if (animalStore.selectedAnimal?.latinName != animal && animal == undefined) return
    //Call API and set value
    const api = new AnimalsApi(
      new Configuration({
        basePath: "https://localhost:5000"
      })
    )

    if (animal !== undefined) {
      const animalName: GetAnimalRequest = {
        latinName: animal as string
      }
      const fetchAnimal = async () => {
        const foundAnimal = await api.getAnimal(animalName)
        const animalObject: IAnimal = {
          displayName: foundAnimal.name?.name as string,
          latinName: foundAnimal.name?.latinName as string,
          previewUrl: foundAnimal.image?.previewUrl as string,
          status: foundAnimal.status as ZooInparkEntitiesIUCNStatus
        }
        animalStore.selectAnimal(animalObject)
        console.log(foundAnimal)
      }
      fetchAnimal()
    }
  }, [animal])

  return (
    <>
      <div className="min-h-screen pt-4">
        <h1 className="pl-12 text-lg leading-6 font-medium text-gray-900">{animalStore.selectedAnimal?.displayName}</h1>
        <h2 className="pl-12 max-w-2xl text-sm text-gray-500">{animalStore.selectedAnimal?.latinName}</h2>

        <div>
          <div className="sm:hidden flex gap-4">
            <label htmlFor="tabs" className="sr-only">
              Select a tab
            </label>
            {/* Use an "onChange" listener to redirect the user to the selected tab URL. */}
            <select
              id="tabs"
              name="tabs"
              className="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
              value={activeTab}
              onChange={t => changeTab(t.target.value)}
            >
              {tabs.map(tab => (
                <option key={tab.name}>{tab.name}</option>
              ))}
            </select>
          </div>
          <div className="hidden sm:block pl-12 pb-5">
            <div className="">
              <nav className="-mb-px flex space-x-8" aria-label="Tabs">
                {tabs.map(tab => (
                  <a
                    key={tab.name}
                    href={tab.href}
                    className={classNames(
                      isActiveTab(tab)
                        ? "border-indigo-500 text-indigo-600"
                        : "border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300",
                      "whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm"
                    )}
                    aria-current={isActiveTab(tab) ? "page" : undefined}
                    onClick={e => {
                      e.preventDefault()
                      changeTab(tab.href)
                    }}
                  >
                    {tab.name}
                  </a>
                ))}
              </nav>
            </div>
          </div>
        </div>
        {tabs.find(t => t.href == activeTab)?.render()}
      </div>
    </>
  )
}
