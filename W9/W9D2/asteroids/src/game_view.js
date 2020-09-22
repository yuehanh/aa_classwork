const Game = require("./game.js");

function GameView(ctx) {
    this.ctx = ctx;
    this.game = new Game();
}

GameView.prototype.start = function () {
    const that = this;
    setInterval(function(){
        that.game.step();
        that.game.draw(that.ctx);
    },20);
};
// GameView.prototype.bindKeyHandlers

module.exports = GameView;