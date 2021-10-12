const authorization = 'pk.eyJ1IjoiZXl0aWVubmU4Nzg3IiwiYSI6ImNrcnF0YXprZDFxazAydm1vZWNkeHdsbnEifQ.ra39QlUIovkr1S3IqGeC_A'
const address = document.querySelector('.form-control')
// Fetch longitude and latitude from the Mapbox API
const callApi = (address) => {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${authorization}`
  fetch(url)
    .then(response => response.json())
    .then(data =>
      console.log(data)
    );
};
// Add an event listener to the submit button of our form

// Insert the coordinates into our HTML
