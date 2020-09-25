const APIUtil = require("./api_util");

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
