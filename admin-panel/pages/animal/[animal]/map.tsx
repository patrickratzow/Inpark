import MapActionBar from "../../../components/map/map-action-bar";
import ConstrainedTripleColumns from "../../../components/constrained-triple-columns";
import MapZoneList from "../../../components/map/map-zone-list";
import MapCanvas from "../../../components/map/map-canvas";
import MapZonePoints from "../../../components/map/map-zone-points";

export default function Map() {
  //Top bar
  return (
    <>
      <MapActionBar></MapActionBar>
      <ConstrainedTripleColumns
        left={<MapZoneList/>}
        middle={<MapCanvas/>}
        right={<MapZonePoints/>}
      />
    </>
  );
}
