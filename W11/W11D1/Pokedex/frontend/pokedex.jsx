import React from "react";
import ReactDom from "react-dom";

document.addEventListener("DOMContentLoaded", () => {
    const rootEl = document.getElementById("root");
    ReactDom.render(<h1>Pokedex</h1>, rootEl);
});
