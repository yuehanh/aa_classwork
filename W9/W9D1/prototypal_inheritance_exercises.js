// Function.prototype.inherits = function(superClass) {
//     function Surrogate() {};
//     Surrogate.prototype = superClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };


Function.prototype.inherits = function(superClass) {
    
    this.prototype = Object.create(superClass.prototype);
    this.prototype.constructor = this;
};

function MovingObject (name) {this.name = name;}

function Ship (name) {MovingObject.call(this, name)}
Ship.inherits(MovingObject);

function Asteroid (name) {MovingObject.call(this, name)}
Asteroid.inherits(MovingObject);


MovingObject.prototype.move = function() {
    console.log(`${this.name} moves`);
}

Ship.prototype.sinks = function() {
    console.log(`${this.name} sinks`);
}

Asteroid.prototype.fly = function() {

    console.log(`${this.name} flies`);
}

let s1 = new Ship('s1');
let a1 = new Asteroid('a1');
let m1 = new MovingObject('m1');

s1.sinks()
a1.move()
m1.move()



