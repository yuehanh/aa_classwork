const Util = require("./utils");

MovingObject.prototype.isWrappable = true;

function MovingObject(attr) {
  this.pos = attr.pos;
  this.vel = attr.vel;
  this.radius = attr.radius;
  this.game = attr.game;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  // this.pos = [this.pos[0],this.pos[1]] // commenting out this line will cause ship's position to update with the bullet once it fires one.

  if (this.game.isOutOfBounds(this.pos)) {
    if (this.isWrappable) {
      this.pos = this.game.warp(this.pos);
    } else {
      this.remove();
    }
  }
};

MovingObject.prototype.isCollidedWith = function (otherObject) {
  return (
    Util.getDistance(this.pos, otherObject.pos) <
    this.radius + otherObject.radius
  );
};

MovingObject.prototype.collideWith = function (otherObject) {};

MovingObject.prototype.remove = function remove() {
  this.game.remove(this);
};

module.exports = MovingObject;
