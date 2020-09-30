import React from "react";
import Minesweeper from "../react_minesweeper";
import Tile from "./tile";

export default class Board extends React.Component {
    constructor(props) {
        super(props);
        // debugger
        // this.props.board = this.props.board.bind(this)
    }

    render() {
        // debugger
        return (
            <div className="grid">
                {this.props.board.grid.map((el, row_idx) => {
                    return (
                        <div key={row_idx} className="row">
                            {el.map((tile, col_idx) => {
                                return (
                                    <Tile
                                        cell={tile}
                                        update={this.props.update} key ={col_idx}
                                    />
                                );
                            })}
                        </div>
                    );
                })}
            </div>
        );
    }
}
