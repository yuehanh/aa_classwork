const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");
const Bullet = require("./bullet.js");

Ship.RADIUS = 10;
Ship.COLOR = "red";
Util.inherits(Ship, MovingObject);

function Ship(attr) {
    MovingObject.call(this, {
        pos: attr.pos,
        vel: [0, 0],
        color: Ship.COLOR,
        radius: Ship.RADIUS,
        game: attr.game,
    });
}

Ship.prototype.relocate = function () {
    this.vel = [0, 0];
    this.pos = this.game.randomPosition();
};

Ship.prototype.power = function (impulse) {
    this.vel[0] += impulse[0];
    this.vel[1] += impulse[1];
};

Ship.prototype.fireBullet = function () {
    const bullet = new Bullet({
        pos: [this.pos[0], this.pos[1]], //de-couple position array pointer of the ship and the bullet
        vel: this.vel,
        game: this.game,
    });
    this.game.add(bullet);
};

module.exports = Ship;
