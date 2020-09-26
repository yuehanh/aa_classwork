/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! exports provided: Clock */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"Clock\", function() { return Clock; });\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\nclass Clock {\n    constructor(divClock) {\n        const clock = new Date();\n        this.hour = clock.getHours();\n        this.minute = clock.getMinutes();\n        this.second = clock.getSeconds();\n        this._tick = this._tick.bind(this);\n        this.second_counter = this.second;\n        this.minute_counter = this.minute;\n        this.hour_counter = this.hour;\n        this.printTime(divClock);\n        setInterval(this._tick, 1000);\n    }\n\n    printTime(divclock) {\n        // console.log(`${this.hour}:${this.minute}:${this.second}`);\n        const string = `${this.hour}:${this.minute}:${this.second}`;\n\n        Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(string, divClock);\n    }\n\n    _tick() {\n        this.second_counter += 1;\n        let minute_passed = Math.floor(this.second_counter / 60);\n        let hour_passed = Math.floor(\n            (this.minute_counter + minute_passed) / 60\n        );\n\n        this.second = this.second_counter % 60;\n        this.minute = (this.minute_counter + minute_passed) % 60;\n        this.hour = (this.hour_counter + hour_passed) % 24;\n        this.printTime();\n\n        // 1. Increment the time by one second.\n        // 2. Call printTime.\n    }\n}\n\nconst divClock = document.querySelector(\"#clock\");\nconst clock = new Clock(divClock);\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! exports provided: dogs */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"dogs\", function() { return dogs; });\nconst dogs = {\n    Corgi: \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n    \"Australian Shepherd\":\n        \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n    Affenpinscher: \"https://www.akc.org/dog-breeds/affenpinscher/\",\n    \"American Staffordshire Terrier\":\n        \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n    Tosa: \"https://www.akc.org/dog-breeds/tosa/\",\n    \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n    \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\",\n};\nfunction dogLinkCreator(dogs) {\n    let dogLinks = [];\n    for (const dog in dogs) {\n        let dogLink = document.createElement(\"a\");\n        dogLink.innerHTML = dog;\n        dogLink.href = dogs[dog];\n        let dogItem = document.createElement(\"li\");\n        dogItem.className = \"dog-link\";\n        dogItem.append(dogLink);\n        dogLinks.push(dogItem);\n    }\n    return dogLinks;\n}\nconst ul = document.querySelector(\".drop-down-dog-list\");\n\nfunction attachDogLinks() {\n    const dogLinks = dogLinkCreator(dogs);\n    for (const link of dogLinks) {\n        ul.append(link);\n    }\n}\n\nattachDogLinks();\n\nconst nav = document.querySelector(\".drop-down-dog-nav\");\nnav.addEventListener(\"mouseenter\", function () {\n    ul.classList.remove(\"hidden\");\n});\n\nnav.addEventListener(\"mouseleave\", function () {\n    ul.classList.add(\"hidden\");\n});\n\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! exports provided: addTodo */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"addTodo\", function() { return addTodo; });\n\nconst todoUL = document.querySelector(\".todos\");\nconst todoForm = document.querySelector(\".add-todo-form\");\nconst todoInput = document.getElementsByName(\"add-todo\")[0] //as TA???\n\nconst todos = JSON.parse(localStorage.todo || '[]');\n\nfunction addTodo(){\n    \n    const todoInputVal = todoInput.value\n    const todoItem = {done: false, item: todoInputVal}\n    todos.push(todoItem);\n    todoInput.value = \"\";\n    localStorage.setItem( 'todo', JSON.stringify(todos) )\n}\n\nfunction populateList(){\n    let i = 0\n    for(const todo of todos){\n        const label = document.createElement(\"label\");\n        const checkbox = document.createElement(\"input\");\n        const li = document.createElement(\"li\")\n        checkbox.type = \"checkbox\";\n        checkbox.id = i\n        checkbox.data = ({done: false})\n        label.innerText = todo.item;\n        label.appendChild(checkbox)\n        li.appendChild(label)\n        todoUL.appendChild(li)\n        i++\n    }\n}\n\n\nfunction toggleTodo (el){\n    el.data.done = !el.data.done;\n}\n\ntodoForm.addEventListener(\"submit\", ()=>{\n    event.preventDefault();\n    addTodo();\n    while (todoUL.firstChild) {\n        todoUL.removeChild(todoUL.firstChild);\n      }\n    populateList();\n});\n\npopulateList();\n\n\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n    const newP = document.createElement(\"p\");\n    newP.textContent = string;\n    htmlElement.innerText = newP.textContent\n};\n\nhtmlGenerator('Party Time.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });