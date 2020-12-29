function insertionSort(arr) {
  for (let i = 1; i < arr.length; i++) {
    let currNum = arr[i];
    let j;
    for (j = i - 1; j > -1 && currNum < arr[j]; j--) {
      arr[j + 1] = arr[j];
    }
    arr[j + 1] = currNum;
  }
}

module.exports = {
  insertionSort,
};
