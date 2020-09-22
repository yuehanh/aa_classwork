console.log("Webpack is working!")

const MovingObject = require("./moving_object.js")
const Asteroid = require("./asteroid.js")

window.MovingObject = MovingObject
window.Asteroid = Asteroid


window.addEventListener('DOMContentLoaded', (event) => {
    const canvas = document.getElementById("game-canvas");
    const ctx = canvas.getContext("2d");
    const mo = new MovingObject({
        pos: [30, 30],
        vel: [10, 10],
        radius: 5,
        color: "#00FF00"
    });
    mo.draw(ctx);

    const as = new Asteroid({pos: [50,50]});
    as.draw(ctx);
});