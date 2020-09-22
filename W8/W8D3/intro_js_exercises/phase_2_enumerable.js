Array.prototype.myEach = function (cb) {
    const n = this.length;
    for (let i = 0; i < n; i++) {
        cb(this[i]);
    }
};

const arr = [1, 2, 3, 5];

// [1,2,3,5].myEach((num) => {
//         console.log(num);
//         });

Array.prototype.myMap = function (cb) {
    const result = [];

    this.myEach((el) => result.push(cb(el)));

    return result;
};

// debugger
// [1,2,3,5].myMap( (num) => {
//     2 * (num);
//     });
console.log(
    [1, 2, 3, 5].myMap((num) => {
        return 2 * num;
    })
);

console.log([1, 2, 3, 5].myMap((num) => 2 * num));

Array.prototype.myReduce = function (cb, init) {
    let arr = this;

    if (init === undefined) {
        init = this[0];
        arr = arr.slice(1);
    }

    arr.myEach((el) => (init = cb(init, el)));
    return init;
};

console.log(
    arr.myReduce(function (acc, el) {
        return acc + el;
    })
);