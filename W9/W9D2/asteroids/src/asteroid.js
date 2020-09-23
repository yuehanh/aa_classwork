const Util = require("./utils.js");
const MovingObject = require("./moving_object");
const Ship = require("./ship.js");
let mapa = new Image();
mapa.src = 'mapa.png';

Util.inherits(Asteroid, MovingObject);
Asteroid.COLOR = "grey";
Asteroid.RADIUS = 50;
Asteroid.VEL_MAX = 10;
Asteroid.VEL_MIN = 5;

// Asteroid.prototype.isWrappable = false;

function Asteroid(attr) {
    MovingObject.call(this, {
        pos: attr.pos,
        vel: Util.randomVec(Asteroid.VEL_MAX * Math.random() + Asteroid.VEL_MIN),
        color: Asteroid.COLOR,
        radius: Asteroid.RADIUS,
        game: attr.game
    });
}


Asteroid.prototype.collideWith = function(otherObject){
//     if (otherObject instanceof Ship) {
//         Ship.prototype.relocate();
//     }
};

Asteroid.prototype.draw = function (ctx){
    ctx.drawImage(mapa,this.pos[0],this.pos[1],this.radius,this.radius);
};


module.exports = Asteroid;