function binarySearch(array, target) {
  let low = 0;
  let high = array.length;
  while (low < high) {
    const mid = Math.floor((high - low) / 2) + low;
    if (array[mid] === target) {
      return true;
    } else if (array[mid] > target) {
      high = mid;
    } else {
      low = mid + 1;
    }
  }
  return false;
}

function binarySearchIndex(array, target) {
  let low = 0;
  let high = array.length;
  while (low < high) {
    const mid = Math.floor((high - low) / 2) + low;
    if (array[mid] === target) {
      return mid;
    } else if (array[mid] > target) {
      high = mid;
    } else {
      low = mid + 1;
    }
  }
  return -1;
}

module.exports = {
  binarySearch,
  binarySearchIndex,
};
