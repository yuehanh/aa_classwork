const View = require("./ttt-view.js")        // require appropriate file
const Game = require("../solution/game") // require appropriate file

  $(() => {
    // Your code here
    const $ttt = $('.ttt')
    const game = new Game()
    const view = new View(game, $ttt)
    
  });
