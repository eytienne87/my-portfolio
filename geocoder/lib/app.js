const authorization = 'pk.eyJ1IjoiZXl0aWVubmU4Nzg3IiwiYSI6ImNrcnF0YXprZDFxazAydm1vZWNkeHdsbnEifQ.ra39QlUIovkr1S3IqGeC_A'
const input = document.querySelector('.form-control')
const form = document.querySelector('form')
const insertArea = document.querySelector('p')
// Fetch longitude and latitude from the Mapbox API
const extractData = (data) => {
  const geoData = data.features[0].center
  const latitude = geoData[1]
  const longitude = geoData[0]
  insertArea.insertAdjacentText('afterbegin', `${latitude},${longitude}`)
};
const callApi = (address) => {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${authorization}`
  fetch(url)
    .then(response => response.json())
    .then(data =>
      extractData(data)
    );
};
// Callback function
const callback = (event) => {
  event.preventDefault();
  return callApi(input.value)
};
// Add an event listener to the submit button of our form
form.addEventListener('submit', callback)
// Insert the coordinates into our HTML
