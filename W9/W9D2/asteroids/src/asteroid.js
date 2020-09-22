const Util = require("./utils.js");
const MovingObject = require("./moving_object");

Asteroid.COLOR = "grey";
Asteroid.RADIUS = 20;
Asteroid.VEL_MAX = 10;

function Asteroid(attr) {
    MovingObject.call(this, {
        pos: attr.pos,
        vel: Util.randomVec(Asteroid.VEL_MAX * Math.random()),
        color: Asteroid.COLOR,
        radius: Asteroid.RADIUS
    });
}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;