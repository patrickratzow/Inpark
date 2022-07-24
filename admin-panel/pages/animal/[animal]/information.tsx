import Link from "next/link"
import Button from "../../../components/button"
import { useRouter } from "next/router"
import useAnimalStore from "../../../stores/animal-store"
import { Fragment, useState } from "react"
import { Listbox, Transition } from "@headlessui/react"
import { CheckIcon, SelectorIcon } from "@heroicons/react/solid"

export default function AnimalInformationPage() {
    const IUCNStatus = [
        {status: 'UNKNOWN'},
        {status: 'EX'},
        { status: 'EW' },
        { status: 'CR' },
        { status: 'EN' },
        { status: 'VU' },
        { status: 'NT' },
        { status: 'LC' },
      ]

  const router = useRouter()
  const { animal } = router.query
  const animalStore = useAnimalStore()
  const [selectedStatus, setSelectedStatus] = useState(IUCNStatus[0])

  return (
    <>
      <div className="min-h-screen pl-8 pt-4">
        <div className="container max-w-md p-4 mt-10 mx-auto w-full">
          <div className="w-40">
            <Listbox value={selectedStatus} onChange={setSelectedStatus}>
              <div className="relative mt-1">
                <Listbox.Button className="relative w-full cursor-default rounded-lg bg-white py-2 pl-3 pr-10 text-left shadow-md focus:outline-none focus-visible:border-indigo-500 focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-75 focus-visible:ring-offset-2 focus-visible:ring-offset-orange-300 sm:text-sm">
                  <span className="block truncate">{selectedStatus.status}</span>
                  <span className="pointer-events-none absolute inset-y-0 right-0 flex items-center pr-2">
                    <SelectorIcon className="h-5 w-5 text-gray-400" aria-hidden="true" />
                  </span>
                </Listbox.Button>
                <Transition
                  as={Fragment}
                  leave="transition ease-in duration-100"
                  leaveFrom="opacity-100"
                  leaveTo="opacity-0"
                >
                  <Listbox.Options className="absolute mt-1 max-h-60 w-full overflow-auto rounded-md bg-white py-1 text-base shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none sm:text-sm">
                    {IUCNStatus.map((person, personIdx) => (
                      <Listbox.Option
                        key={personIdx}
                        className={({ active }) =>
                          `relative cursor-default select-none py-2 pl-10 pr-4 ${
                            active ? "bg-amber-100 text-amber-900" : "text-gray-900"
                          }`
                        }
                        value={person}
                      >
                        {({ selected }) => (
                          <>
                            <span className={`block truncate ${selected ? "font-medium" : "font-normal"}`}>
                              {person.status}
                            </span>
                            {selected ? (
                              <span className="absolute inset-y-0 left-0 flex items-center pl-3 text-amber-600">
                                <CheckIcon className="h-5 w-5" aria-hidden="true" />
                              </span>
                            ) : null}
                          </>
                        )}
                      </Listbox.Option>
                    ))}
                  </Listbox.Options>
                </Transition>
              </div>
            </Listbox>
          </div>
        </div>
      </div>
    </>
  )
}
