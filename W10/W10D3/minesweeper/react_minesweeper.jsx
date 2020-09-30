import React from "react";
import Game from "./frontend/game";

class Minesweeper extends React.Component {
    render() {
        return (
            <div>
                <h1 className = "title">Minesweeper</h1>
                <h1>
                    {" "}
                    <Game />{" "}
                </h1>
            </div>
        );
    }
}

export default Minesweeper;
