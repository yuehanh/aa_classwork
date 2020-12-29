function quickSort(array) {
  if (array.length <= 1) return array;

  const pivot = array.pop();

  const [left, right] = partition(array, pivot);
  return [...quickSort(left), pivot, ...quickSort(right)];
}

function partition(array, pivot) {
  const left = array.filter((el) => el < pivot);
  const right = array.filter((el) => el >= pivot);
  return [left, right];
}

module.exports = {
  quickSort,
};
