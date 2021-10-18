import mapboxgl from 'mapbox-gl';

const displayMap = (authorization, geoData) => {
  mapboxgl.accessToken = authorization;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: geoData,
    zoom: 12
  });
  new mapboxgl.Marker()
    .setLngLat(geoData)
    .addTo(map);
}

export { displayMap };
