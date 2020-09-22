function sum(){
    let arr = Array.from(arguments);
    let sum = 0;
    for(let i = 0; i < arr.length ; i++) {
        sum += arr[i];
    }
    return sum
}

// console.log(sum(1, 2, 3, 4) === 10)

function sum1(...args){
    let sum = 0;
    args.forEach((el) => {
        sum += el;        
    })
    return sum
}

// console.log(sum1(1, 2, 3, 4))

Function.prototype.myBind = function () {
    const that = this;
    let cxt = arguments[0]
    let arr = Array.from(arguments).slice(1);
    return function(...args){that.apply(cxt,arr.concat(args))}
}



Function.prototype.myBind = function (cxt,...args1) {
    const that = this;
    
    return function(...args){that.call(cxt, ...args1,...args)}
}



class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }
  
  const markov = new Cat("Markov");
  const pavlov = new Dog("Pavlov");
  
  markov.says.myBind(pavlov, "meow", "Kush")();
  // Pavlov says meow to Kush!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "a tree"
  markov.says.myBind(pavlov)("meow", "a tree");
  // Pavlov says meow to a tree!
  // true
  
  // bind time arg is "meow", call time arg is "Markov"
  markov.says.myBind(pavlov, "meow")("Markov");
  // Pavlov says meow to Markov!
  // true
  
  // no bind time args (other than context), call time args are "meow" and "me"
  const notMarkovSays = markov.says.myBind(pavlov);
  notMarkovSays("meow", "me");
  // Pavlov says meow to me!
  // true


function curriedSum (numArgs) {
    let numbers = [];
    const _curriedSum = function (number){
        numbers.push(number)
        if (numbers.length === numArgs){
            return sum(...numbers);
        } else {

            return _curriedSum;
        }
    }
    return _curriedSum;

}



Function.prototype.curry = function (numArgs) {
    let numbers = [];
    const that = this;
    return function _curry(number){
        numbers.push(number);
        if (numbers.length === numArgs){
            return that(...numbers);
        } else {
            return _curry;
        }
    }
}


Function.prototype.curry2 = function (numArgs) {
    let numbers = [];
    const that = this;
    return function _curry(number) {
        numbers.push(number);
        if (numbers.length === numArgs) {
            return that.apply(that, numbers);
        } else {
            return _curry;
        }
    }
}


const sum2 = sum.curry(4);
console.log(sum2(5)(30)(20)(1))
