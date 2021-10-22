/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./lib/index.js":
/*!**********************!*\
  !*** ./lib/index.js ***!
  \**********************/
/***/ (() => {

eval("const apiKey = \"5fc564ca2ef5e986a24625cd23f78e06\"\n// fetch weather data from OpenWeatherMap API\nconst callApi = (city) => {\n  const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}`\n  fetch(url)\n    .then(response => response.json())\n    .then(data =>\n      console.log(data)\n    );\n};\n\ncallApi('Paris')\n\n\n//# sourceURL=webpack://weather-forecast/./lib/index.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./lib/index.js"]();
/******/ 	
/******/ })()
;