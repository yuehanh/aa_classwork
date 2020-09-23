const MoveError = require("../solution/moveError");

class View {
    constructor(game, $el) {
        this.game = game;
        this.el = $el;
        this.setupBoard();
        this.bindEvents();
    }

    bindEvents() {
        const that = this;
        $(".board").on("click", "li", function (event) {
            that.makeMove($(event.target));
        });
    }

    makeMove($square) {
        try {
            let player = this.game.currentPlayer;
            this.game.playMove($square.data().pos);
            $square.addClass(player);
        } catch (err) {
            alert(err.msg);
        }

        if (this.game.isOver()) {
            $(".board").addClass("game-over").off();
            if (this.game.winner()) {
                let $item = $(`.${this.game.winner()}`);
                $item.addClass("winner");
                let $winner = $("<h3></h3>").text(
                    `${this.game.winner()} has won!`
                );
                $("body").append($winner);
            } else {
                let $noWinner = $("<h3></h3>").text("NO ONE WINS!");
                $("body").append($noWinner);
            }
        }
    }

    setupBoard() {
        const $board = $("<ul></ul>");
        this.el.append($board);
        $board.addClass("board");

        for (let i = 0; i < 9; i++) {
            let $li = $("<li></li>")
                .addClass("grid")
                .data({ pos: [Math.floor(i / 3), i % 3] });
            $board.append($li);
        }
    }
}

module.exports = View;
