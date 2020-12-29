function countingSort(arr, max) {
  const buckets = Array(max + 1).fill(0);
  for (const num of arr) {
    buckets[num]++;
  }
  const sorted = [];
  let i = 0;
  for (let num of buckets) {
    while (num > 0) {
      sorted.push(i);
      num--;
    }
    i++;
  }
  return sorted;
}

module.exports = {
  countingSort,
};
