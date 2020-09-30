import React from "react";
import * as Minesweeper from "../other/minesweeper";
import Board from "./board";

export default class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = { board: new Minesweeper.Board(8, 5) };
        this.updateGame = this.updateGame.bind(this);
        this.restart = this.restart.bind(this);
        //any function that happens on browser needs to be binded
    }

    updateGame(tile, flag) {
        flag ? tile.toggleFlag() : tile.explore();
        this.setState({ board: this.state.board });
    }

    restart() {
        this.setState({ board: new Minesweeper.Board(8, 5) });
    }

    render() {
        const won = this.state.board.won();
        const lost = this.state.board.lost();
        const status = won ? "won" : "lost";
        let popUp;
        if (won || lost) {
            popUp = (
                <div className="modal-screen">
                    <div className="modal-content">
                        <p> You {status}!</p>
                        <button onClick = {this.restart}> Play Again </button>
                    </div>
                </div>
            );
        }
        return (
            <div>
                {popUp}
                <Board board={this.state.board} update={this.updateGame} />
            </div>
        );
    }
}
