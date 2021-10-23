const apiKey = process.env.API_KEY

const cityDiv = document.getElementById('location')
const timeDiv = document.getElementById('timestamp')
const weatherDiv = document.getElementById('weather-type')
const celsiusDiv = document.getElementById('celsius-with-icon')

// Function for converting a unix into a timestamp
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
// Function to capitalize letter of each word
const capitalize = (str) => {
  const arr = str.split(" ");
  for (var i = 0; i < arr.length; i++) {
    arr[i] = arr[i].charAt(0).toUpperCase() + arr[i].slice(1);
  }
  const str2 = arr.join(" ");
  return str2
};

const extractData = (data) => {
  const city = data.name
  const date = data.dt
  const timestamp = timestampGenerator(date)
  const weatherType = capitalize(data.weather[0].description)
  const celsius = Math.round(data.main.temp)
  const iconId = data.weather[0].icon
  celsiusDiv.insertAdjacentHTML('afterbegin',
                                `<div class="container d-flex justify-content-between align-items-center p-0">
                                  <p class="degree mb-0">${celsius}°C</p>
                                  <img src="http://openweathermap.org/img/wn/${iconId}@2x.png" alt="icon">
                                 </div>`)
  weatherDiv.insertAdjacentHTML('afterbegin', `<p class="">${weatherType}</p>`)
  timeDiv.insertAdjacentHTML('afterbegin', `<p class="">${timestamp}</p>`)
  cityDiv.insertAdjacentHTML('afterbegin', `<p class="">Weather in ${city}</p>`)
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

callApi('los angeles')
