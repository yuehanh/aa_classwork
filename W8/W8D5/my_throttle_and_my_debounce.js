// Function.prototype.myThrottle = function(delay) {
//     let tooSoon = true;
//     const that = this;
//     return ()=>{if (tooSoon) {
//       tooSoon = false;
//       setTimeout(()=>{
//             tooSoon = true ; 
//           },delay);
//       that();}}

// }

// // Function.prototype.myThrottle = function(interval) {
// //   // declare a variable outside of the returned function
// //   let tooSoon = false;
// //   return (...args) => {


// //     // the function only gets invoked if tooSoon is false
// //     // it sets tooSoon to true, and uses setTimeout to set it back to
// //     // false after interval ms
// //     // any invocation within this interval will skip the if 
// //     // statement and do nothing
// //     if (!tooSoon) {
// //       tooSoon = true;
// //       setTimeout(() => tooSoon = false, interval);
// //       this(...args);
// //     }
// //   }
// // }
// class Neuron {
//     fire() {
//       console.log("Firing!");
//     }
//   }
  
//   const neuron = new Neuron();
//   // When we create a new Neuron,
//   // we can call #fire as frequently as we want
  
//   // The following code will try to #fire the neuron every 10ms. Try it in the console:
// //   const interval = setInterval(() => {
// //     neuron.fire();
// //   }, 10);
  
//   // You can use clearInterval to stop the firing:
// //   clearInterval(interval);
  
//   // Using Function#myThrottle, we should be able to throttle
//   // the #fire function of our neuron so that it can only fire
//   // once every 500ms:
  
//   neuron.fire = neuron.fire.myThrottle(1000);
  
//   const interval = setInterval(() => {
//     neuron.fire();
//   }, 10);
  
//   // This time, if our Function#myThrottle worked correctly,
//   // the Neuron#fire function should only be able to execute
//   // every 500ms, even though we're still trying to invoke it
//   // every 10ms!
  
//   // If we want this behavior for ALL neurons, we can do the same logic in the constructor:
  
// //   class Neuron {
// //     constructor() {
// //       this.fire = this.fire.myThrottle(500);
// //     }
  
// //     fire() {
// //       console.log("Firing!");
// //     }
// //   }



function Animal (name) {
  this.name = name;
};

Animal.prototype.sayHello = function () {
  console.log("Hello, my name is " + this.name);
};

function Dog (name, coatColor) {
  // Animal.call(this, name);

  this.coatColor = coatColor;
}

Dog.prototype.play = function() {
  console.log("Hello, my play is" + this.coatColor);
}

// A surrogate will be used to construct `Dog.prototype`.
// A `Surrogate` instance should delegate to `Animal.prototype`.
function Surrogate () {};
Surrogate.prototype = Animal.prototype;

// // Set `Dog.prototype` to a `Surrogate` instance.
// let objec = new Surrogate();
// Dog.prototype = objec

Dog.prototype = new Surrogate();

function Cat(name,color) {this.name = name, this.color = color} 
// Dog.prototype = Object.create(Animal.prototype)
// Make sure that instances of Dog have instance.constructor === Dog (rather than Animal)
// Dog.prototype.constructor = Dog; 

const liesel = new Dog("Liesel", "Black");
const ani = new 

liesel.sayHello();