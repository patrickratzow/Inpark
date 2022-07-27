import Link from "next/link"
import Button from "../../components/button"
import { useRouter } from "next/router"
import useAnimalStore from "../../stores/animal-store"
import { Fragment, useState } from "react"
import { Listbox, Transition } from "@headlessui/react"
import { CheckIcon, SelectorIcon } from "@heroicons/react/solid"
import { ZooInparkContractsIUCNStatusDto } from "../../out"

export default function AnimalInformationPage() {
  const IUCNStatus = [
    { status: "UKENDT" },
    { status: "EX" },
    { status: "EW" },
    { status: "CR" },
    { status: "EN" },
    { status: "VU" },
    { status: "NT" },
    { status: "LC" }
  ]

  interface IUCNStatus {
    status: string
  }

  const statusMap = new Map([
    [ZooInparkContractsIUCNStatusDto.NUMBER_0, { status: "UKENDT" } as IUCNStatus],
    [ZooInparkContractsIUCNStatusDto.NUMBER_1, { status: "EX" } as IUCNStatus],
    [ZooInparkContractsIUCNStatusDto.NUMBER_2, { status: "EW" } as IUCNStatus],
    [ZooInparkContractsIUCNStatusDto.NUMBER_3, { status: "CR" } as IUCNStatus],
    [ZooInparkContractsIUCNStatusDto.NUMBER_4, { status: "EN" } as IUCNStatus],
    [ZooInparkContractsIUCNStatusDto.NUMBER_5, { status: "VU" } as IUCNStatus],
    [ZooInparkContractsIUCNStatusDto.NUMBER_6, { status: "NT" } as IUCNStatus],
    [ZooInparkContractsIUCNStatusDto.NUMBER_7, { status: "LC" } as IUCNStatus]
  ])

  const statusArray = Array.from(statusMap.values())

  const router = useRouter()
  const { animal } = router.query
  const animalStore = useAnimalStore()
  const [selectedStatus, setSelectedStatus] = useState(IUCNStatus[animalStore.selectedAnimal?.status as number])

  return (
    <>
      <div className="relative max-w-4xl ml-32 md:px-8 xl:px-0">
        <div className="pb-16">
          <div className="px-4 sm:px-6 md:px-0">
            <div className="">
              {/* Tabs */}
              {/* Description list with inline editing */}
              <div className="mt-10 divide-y divide-gray-200">
                <div className="space-y-1">
                  <h3 className="text-lg leading-6 font-medium text-gray-900">Profile</h3>
                  <p className="max-w-2xl text-sm text-gray-500">Her står alt information om dyret</p>
                  {}
                </div>
                <div className="mt-6">
                  <dl className="divide-y divide-gray-200">
                    <div className="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4">
                      <dt className="text-sm font-medium text-gray-500">Navn</dt>
                      <dd className="mt-1 flex text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                        <span className="flex-grow">{animalStore.selectedAnimal?.displayName}</span>
                        <span className="ml-4 flex-shrink-0">
                          <button
                            type="button"
                            className="bg-white rounded-md font-medium text-purple-600 hover:text-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                          >
                            Opdater
                          </button>
                        </span>
                      </dd>
                    </div>
                    <div className="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:pt-5">
                      <dt className="text-sm font-medium text-gray-500">Billed</dt>
                      <dd className="mt-1 flex text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                        <span className="flex-grow">
                          <img className="h-8 w-8 rounded-full" src={animalStore.selectedAnimal?.previewUrl} alt="" />
                        </span>
                        <span className="ml-4 flex-shrink-0 flex items-start space-x-4">
                          <button
                            type="button"
                            className="bg-white rounded-md font-medium text-purple-600 hover:text-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                          >
                            Update
                          </button>
                          <span className="text-gray-300" aria-hidden="true">
                            |
                          </span>
                          <button
                            type="button"
                            className="bg-white rounded-md font-medium text-purple-600 hover:text-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                          >
                            Remove
                          </button>
                        </span>
                      </dd>
                    </div>
                    <div className="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:border-b sm:border-gray-200">
                      <dt className="text-sm font-medium text-gray-500">Job title</dt>
                      <dd className="mt-1 flex text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                        <span className="flex-grow">
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
                                  {statusArray.map((status, statusIdx) => (
                                    <Listbox.Option
                                      key={statusIdx}
                                      className={({ active }) =>
                                        `relative cursor-default select-none py-2 pl-10 pr-4 ${
                                          active ? "bg-amber-100 text-amber-900" : "text-gray-900"
                                        }`
                                      }
                                      value={status}
                                    >
                                      {({ selected }) => (
                                        <>
                                          <span
                                            className={`block truncate ${selected ? "font-medium" : "font-normal"}`}
                                          >
                                            {status.status}
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
                        </span>
                        <span className="flex-grow"></span>
                        <span className="ml-4 flex-shrink-0"></span>
                      </dd>
                    </div>
                    <div className="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4">
                      <dt className="text-sm font-medium text-gray-500">Beskrivelse</dt>
                      <dd className="mt-1 flex text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                        <span className="flex-grow">
                          <textarea placeholder="Her står noget om dyret"></textarea>
                        </span>
                        <span className="ml-4 flex-shrink-0">
                          <button
                            type="button"
                            className="bg-white rounded-md font-medium text-purple-600 hover:text-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                          >
                            Opdater
                          </button>
                        </span>
                      </dd>
                    </div>
                  </dl>
                </div>
              </div>

              <div className="mt-10 divide-y divide-gray-200">
                <div className="space-y-1">
                  <h3 className="text-lg leading-6 font-medium text-gray-900">Account</h3>
                  <p className="max-w-2xl text-sm text-gray-500">
                    Manage how information is displayed on your account.
                  </p>
                </div>
                <div className="mt-6">
                  <div className="divide-y divide-gray-200">
                    <div className="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4">
                      <dt className="text-sm font-medium text-gray-500">Language</dt>
                      <dd className="mt-1 flex text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                        <span className="flex-grow">English</span>
                        <span className="ml-4 flex-shrink-0">
                          <button
                            type="button"
                            className="bg-white rounded-md font-medium text-purple-600 hover:text-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                          >
                            Update
                          </button>
                        </span>
                      </dd>
                    </div>
                    <div className="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:pt-5">
                      <dt className="text-sm font-medium text-gray-500">Date format</dt>
                      <dd className="mt-1 flex text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                        <span className="flex-grow">DD-MM-YYYY</span>
                        <span className="ml-4 flex-shrink-0 flex items-start space-x-4">
                          <button
                            type="button"
                            className="bg-white rounded-md font-medium text-purple-600 hover:text-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                          >
                            Update
                          </button>
                          <span className="text-gray-300" aria-hidden="true">
                            |
                          </span>
                          <button
                            type="button"
                            className="bg-white rounded-md font-medium text-purple-600 hover:text-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500"
                          >
                            Remove
                          </button>
                        </span>
                      </dd>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
