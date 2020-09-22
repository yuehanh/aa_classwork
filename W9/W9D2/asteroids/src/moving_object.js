const Util = require("./utils");


function MovingObject(attr){
    this.pos = attr.pos;
    this.vel = attr.vel;
    this.radius = attr.radius;
    this.color = attr.color;
    this.game = attr.game
}

MovingObject.prototype.draw = function (ctx){
    ctx.beginPath();
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        false);
    ctx.fillStyle = this.color;
    ctx.fill();
}

MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.pos = this.game.warp(this.pos);
}

MovingObject.prototype.isCollidedWith = function(otherObject){
     return Util.getDistance(this.pos, otherObject.pos) < (this.radius + otherObject.radius);
}

MovingObject.prototype.collideWith = function(otherObject){};



module.exports = MovingObject;