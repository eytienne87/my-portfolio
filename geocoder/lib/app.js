import { displayMap } from "./plugins/init_mapboxgl";

const input = document.querySelector('.form-control');
const form = document.querySelector('form');
const insertArea = document.querySelector('p');
const apiKey = process.env.API_KEY
// Insert coordinates and map in HTML
const extractData = (data) => {
  const geoData = data.features[0].center;
  const latitude = geoData[1];
  const longitude = geoData[0];
  insertArea.innerText = ''
  insertArea.insertAdjacentText('afterbegin', `${latitude}, ${longitude}`);
  displayMap(apiKey, geoData);
};
// Fetch longitude and latitude from the Mapbox API
const callApi = (address) => {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${apiKey}`
  fetch(url)
    .then(response => response.json())
    .then(data =>
      extractData(data)
    );
};
// Callback
const callback = (event) => {
  event.preventDefault();
  return callApi(input.value)
};
// Event listener for the submission of the form
form.addEventListener('submit', callback)
