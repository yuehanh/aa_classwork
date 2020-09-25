const FollowToggle = require("./follow_toggle.js");
const APIUntil = require("./api_util");
const UsersSearch = require("./users_search.js")
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