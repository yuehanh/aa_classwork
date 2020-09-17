Array.prototype.uniq = function() {
    let result = [];

    for (let i = 0; i < this.length; i++) {
        if (!result.includes(this[i])){
            result.push(this[i]);
        } 
    }
    return result;
}

console.log([1,2,2,3,4,5].uniq())


Array.prototype.twoSum = function() {
    let hash = {};
    let result = [];
    this.forEach(
            (el,idx) => {
            if (hash[-el]) {
                let pair = hash[-el].map((pairidx) => [pairidx, idx]);
                result = result.concat(pair);
            }
            hash[el] ? hash[el].push(idx) : hash[el] = [idx];
        }
    )
    return result;
}

console.log([2,2,3,4,-4,-3,-2,3].twoSum())

Array.prototype.transpose = function() {
    let nr = this.length
    let nc = this[0].length
    let result = Array.from(Array(nr), () => Array(nc));
    
    for (let i = 0; i < nr; i++){
        for (let j = 0; j < nc; j++){
            result[j][i] = this[i][j];
        }
    }
    return result;
}
console.log([ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 6, 7, 8 ] ].transpose())
