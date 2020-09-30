import React from "react";
// 0x26F3 flag
//\u2622
export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(flag) {
        // const flag = event.altKey ? true : false;
        //alt key = specific to the alt key being pressed with the click

        this.props.update(this.props.cell, flag);
    }

    render() {
        let status;
        let explore = this.props.cell.explored ? "explored" : "unexplored";
        //created a let to variable to make it bombed if is a bomb
        const count = this.props.cell.adjacentBombCount();
        if (this.props.cell.explored) {
            if (this.props.cell.bombed) {
                status = "\u2622";
                explore = "bombed";
            } else {
                status = count ? count : "";
            }
        } else {
            status = this.props.cell.flagged ? "\u26F3" : "";
        }

        return (
            <div
                className={`tile ${explore}`}
                onClick={() => this.handleClick(false)}
                onContextMenu={() => {
                    event.preventDefault();
                    this.handleClick(true);
                }}
            >
                {status}
            </div>
        );
    }
}
