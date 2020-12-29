function swap(array, idx1, idx2) {
  [array[idx1], array[idx2]] = [array[idx2], array[idx1]];
  return array;
}

function bubbleSort(array) {
  let unSorted = true;
  let len = array.length - 1;
  while (unSorted) {
    unSorted = false;

    for (let i = 0; i < len; i++) {
      if (array[i] > array[i + 1]) {
        swap(array, i, i + 1);
        unSorted = true;
      }
    }
  }
}

module.exports = {
  bubbleSort,
  swap,
};
