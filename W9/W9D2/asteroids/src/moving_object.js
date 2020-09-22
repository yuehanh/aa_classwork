function MovingObject(attr){
    this.pos = attr.pos;
    this.vel = attr.vel;
    this.radius = attr.radius;
    this.color = attr.color;
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
}

module.exports = MovingObject;