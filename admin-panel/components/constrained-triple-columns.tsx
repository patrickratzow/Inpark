type Children = JSX.Element | JSX.Element[]

interface Props {
  left: Children
  middle: Children
  right: Children
}

export default function ConstrainedTripleColumns({ left, middle, right }: Props) {
  return (
    <>
    {
      //This needs to not fill as much
    }
      <div className="flex-grow w-full max-w-full h-full mx-auto lg:flex">
        {/* Left sidebar & main wrapper */}
        <div className="flex-1 min-w-0 bg-white xl:flex">
          <div className="border-b border-gray-200 xl:border-b-0 xl:flex-shrink-0 xl:w-64 xl:border-r xl:border-gray-200 bg-white">
            <div className="h-full pl-4 sm:pl-6 lg:pl-8 xl:pl-0">
              {/* Start left column area */}
              <div className="h-full relative" style={{ minHeight: "12rem" }}>
                <div className="absolute inset-0 rounded-lg">{left}</div>
              </div>
              {/* End left column area */}
            </div>
          </div>

          <div className="bg-white lg:min-w-0 lg:flex-1">
            <div className="h-full">
              {/* Start main area*/}
              <div className="relative" style={{ minHeight: "36rem" }}>
                <div className="absolute rounded-lg"></div>
                {middle}
              </div>
            </div>
            {/* End main area */}
          </div>
        </div>

        <div className="bg-gray-50 lg:flex-shrink-0 lg:border-l lg:border-gray-200 xl:pr-0">
          <div className="h-full lg:w-80">
            {/* Start right column area */}
            <div className="h-full relative" style={{ minHeight: "16rem" }}>
              <div className="absolute inset-0 rounded-lg">{right}</div>
            </div>
            {/* End right column area */}
          </div>
        </div>
      </div>
    </>
  )
}
