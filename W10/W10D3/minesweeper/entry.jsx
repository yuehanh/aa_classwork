import React from "react";
import ReactDom from "react-dom";
import Minesweeper from "./react_minesweeper";

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDom.render(<Minesweeper />, root);
});
