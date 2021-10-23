const apiKey = process.env.API_KEY
const weatherDiv = document.getElementById('weather-type')
const celsiusDiv = document.getElementById('celsius-with-icon')

const timestampGenerator = (unix) => {
  const milliseconds = unix * 1000
  const dateObject = new Date(milliseconds)
  return dateObject.toLocaleString("en-US", {
     weekday: "long",
     month: "long",
     day: "numeric",
     hour: "numeric"
    })
};


const extractData = (data) => {
  const date = data.dt
  const timestamp = timestampGenerator(date)
  const weatherType = data.weather[0].description
  const celsius = Math.round(data.main.temp)
  const iconId = data.weather[0].icon
  celsiusDiv.insertAdjacentHTML('afterbegin',
                                `<div class="container d-flex justify-content-center align-items-center">
                                  <img src="http://openweathermap.org/img/wn/${iconId}@2x.png" alt="icon">
                                  <p class="mb-0">${celsius}°C</p>
                                 </div>`)
  weatherDiv.insertAdjacentHTML('afterbegin', `<p class="">${weatherType}</p>`)
};

// fetch weather data from OpenWeatherMap API
const callApi = (city) => {
  const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apiKey}`
  fetch(url)
    .then(response => response.json())
    .then(data =>
      extractData(data)
    );
};

callApi('montreal')
