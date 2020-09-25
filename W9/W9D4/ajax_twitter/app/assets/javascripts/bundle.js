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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
    followUser: (id) => {
        return new Promise((resolve, reject) => {
            resolve(
                $.ajax({
                    method: "POST",
                    url: `/users/${id}/follow`,
                    dataType: "JSON",
                })
            );
        });
    },

    unfollowUser: (id) => {
        // ...
        return new Promise((resolve, reject) => {
            resolve(
                $.ajax({
                    method: "DELETE",
                    url: `/users/${id}/follow`,
                    dataType: "JSON",
                })
            );
        });
    },
};

module.exports = APIUtil;

// const myFirstPromise = new Promise((resolve, reject) => {
//     // resolve will pass the argument to .then
//     // reject passes the arg to .catch
//     setTimeout(() => {
//         resolve("failure");
//         // reject("success")
//     }, 3000);
// });

// myFirstPromise
//     // .then will keep going as long as these are successful
//     .then((successMessage) =>
//         console.log(`Yaay!! ${successMessage} first then`)
//     )
//     .then((successMessage) =>
//         console.log(`Yaay!! ${successMessage} second then`)
//     )
//     .catch((failureMessage) => console.log(`Booo !! ${failureMessage}`));


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class FollowToggle {
    constructor($ele) {
        this.userID = $ele.data("user-id");
        this.followState = $ele.data("initial-follow-state");
        this.$element = $ele;
        this.render();
        this.handleClick();
        
    }

    render() {
        if (this.followState === "unfollowed") {
            this.$element.text("Follow!");
        } else {
            this.$element.text("Unfollow!");
        }
    }

    handleClick() {
        const that = this;
        this.$element.on("click", () => {
            event.preventDefault();
            if (that.followState === "unfollowed") {
                // debugger
                // Have to return the promise to call then on it after
                // Dumbest way to refactor code
                APIUtil.followUser(that.userID).then(() => {
                    that.followState = "followed";
                    that.render();
                    // debugger

                    this.$element.prop("disabled", false);
                    $("h1").find(".sk-chase").remove();
                });
            } else {
                // debugger
                APIUtil.unfollowUser(that.userID).then(() => {
                    that.followState = "unfollowed";
                    that.render();
                    // debugger
                    this.$element.prop("disabled",false);
                    $("h1").find(".sk-chase").remove();
                });
            }
            this.$element.attr("disabled", true);
            this.addSpinner();
        });
        
    }


    addSpinner(){
        $("h1").append('<div class="sk-chase"><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div><div class="sk-chase-dot"></div></div>')
    }
}

// what are you doing?

module.exports = FollowToggle;

// const fetchNewGif = () => {
//     // Initiate AJAX call to GIPHY API, take response and put on the DOM
//     GifApiUtil.newGifAJAX()
//       .then(response => {
//         // extract url from response
//         const url = response.data.image_url;
//         // append image to .gif-display div element
//         appendGif(url);
//       })
//   };


/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
const APIUntil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");
const UsersSearch = __webpack_require__(/*! ./users_search.js */ "./frontend/users_search.js")
// whole function needs to be wrapped in parenthases to run whole function

$( () => {
    // debugger;
    $("button.follow-toggle").each( (idx, ele) => {
        const $followButton = $(ele);
        const $followToggle = new FollowToggle($followButton);
    })
    // const $followButton =  $("button.follow-toggle");
    // const $followToggle = new FollowToggle($followButton);

    $("nav.users-search").each((idx, ele) =>{
        const $userSearch = $(ele);
        const $userSearchResult = new UsersSearch($userSearch);    })
});

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports) {

class UsersSearch {
    constructor($ele){
        this.$element = $ele;
        this.input = $ele.find("input").eq(0).val()
        this.ul = $ele.find("ul")
    }
}

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map