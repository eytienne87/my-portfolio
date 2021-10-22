const apiKey = process.env.API_KEY
// fetch weather data from OpenWeatherMap API
const callApi = (city) => {
  const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}`
  fetch(url)
    .then(response => response.json())
    .then(data =>
      console.log(data)
    );
};

callApi('Paris')
