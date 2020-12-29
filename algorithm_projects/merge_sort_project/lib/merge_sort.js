function merge(array1, array2) {
  let i = 0;
  let j = 0;
  let merged = [];
  while (i < array1.length && j < array2.length) {
    if (array1[i] < array2[j]) {
      merged.push(array1[i]);
      i++;
    } else {
      merged.push(array2[j]);
      j++;
    }
  }

  if (i < array1.length) {
    return merged.concat(array1.slice(i));
  } else {
    return merged.concat(array2.slice(j));
  }
}

function mergeSort(array) {
  if (array.length <= 1) return array;
  const mid = Math.floor(array.length / 2);
  const left = mergeSort(array.slice(0, mid));
  const right = mergeSort(array.slice(mid));
  return merge(left, right);
}

module.exports = {
  merge,
  mergeSort,
};
