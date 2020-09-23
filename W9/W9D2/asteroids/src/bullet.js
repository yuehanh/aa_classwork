const MovingObject = require("./moving_object");
const Util = require("./utils");

Util.inherits(Bullet,MovingObject);
Bullet.VEL = 20;
Bullet.RADIUS = 5;
Bullet.prototype.isWrappable = false;
// Bullet.COLOR = Util.getRandomColor();


function Bullet (attr){
    MovingObject.call(this,{
        pos: attr.pos,
        vel: Util.scale(attr.vel, Bullet.VEL),
        color: Util.getRandomColor(),
        radius: Bullet.RADIUS,
        game: attr.game
    })
}



module.exports = Bullet;

