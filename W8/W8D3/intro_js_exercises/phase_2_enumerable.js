Array.prototype.myEach = function (cb){
    const n = this.length;
    for (let i = 0; i < n; i++ ){
        cb(this[i]);
    }
}

const arr = [1,2,3,5];

// [1,2,3,5].myEach((num) => {
//         console.log(num);
//         });

Array.prototype.myMap = function (cb) {
    const result = [];

    this.myEach(
        (el) => result.push(cb(el));
    );

    return result;
}

// debugger
// [1,2,3,5].myMap( (num) => {
//     2 * (num);
//     });
console.log([1,2,3,5].myMap( (num) =>{
    return 2 * (num)
}));

console.log([1,2,3,5].myMap( (num) => 2 * num));

Array.prototype.myReduce = function(cb, init){
    let arr = this
    
    if (init === 0 ) {
        init = this[0]
        arr = arr.slice(1);
    }

}


function celebrityIDCreator (theCelebrities) {
    var i;
    var uniqueID = 100;
    for (i = 0; i < theCelebrities.length; i++) {
        theCelebrities[i]["id"] = function (j)  { // the j parametric variable is the i passed in on invocation of this IIFE
            return function () {
                return uniqueID + j; // each iteration of the for loop passes the current value of i into this IIFE and it saves the correct value to the array
            } () // BY adding () at the end of this function, we are executing it immediately and returning just the value of uniqueID + j, instead of returning a function.
        } (i); // immediately invoke the function passing the i variable as a parameter
    }

    return theCelebrities;
    }