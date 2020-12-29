function radixSort(arr) {
  if (!Array.isArray(arr)) return null;
  const maxDigit = getMaxDigit(Math.max(...arr));
  for (let i = 0; i < maxDigit; i++) {
    const bucket = Array.from({ length: 10 }, () => []);
    for (let j = 0; j < arr.length; j++) {
      const digit = getNthDigit(arr[j], i);
      bucket[digit].push(arr[j]);
    }
    arr = [].concat(...bucket);
  }
  return arr;
}

function getNthDigit(num, n) {
  return Math.floor(Math.abs(num) / 10 ** n) % 10;
}

function getMaxDigit(num) {
  return num.toString().length;
}
module.exports = {
  radixSort,
};
