function swap(arr, index1, index2) {
  [arr[index1], arr[index2]] = [arr[index2], arr[index1]];
}

function selectionSort(arr) {
  let counter = 0;

  while (counter < arr.length) {
    let min = arr[counter];
    let minI = counter;
    for (let i = counter + 1; i < arr.length; i++) {
      if (arr[i] < min) {
        min = arr[i];
        minI = i;
      }
    }
    if (minI !== counter) {
      swap(arr, minI, counter);
    }
    counter += 1;
  }
}

module.exports = {
  selectionSort,
  swap,
};
