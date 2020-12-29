// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.

const minPathSum = function (grid) {
  const sumArray = Array.from(Array(grid.length), () =>
    Array(grid[0].length).fill(Infinity)
  );

  let rowNum = grid.length;
  let colNum = grid[0].length;
  sumArray[0][0] = grid[0][0];
  sumArray.forEach((row, rowIdx) => {
    row.forEach((el, colIdx) => {
      if (rowIdx < rowNum - 1) {
        sumArray[rowIdx + 1][colIdx] = Math.min(
          sumArray[rowIdx + 1][colIdx],
          grid[rowIdx + 1][colIdx] + sumArray[rowIdx][colIdx]
        );
      }
      if (colIdx < colNum - 1) {
        sumArray[rowIdx][colIdx + 1] = Math.min(
          sumArray[rowIdx][colIdx + 1],
          grid[rowIdx][colIdx + 1] + sumArray[rowIdx][colIdx]
        );
      }
    });
  });
  return sumArray[grid.length - 1][grid[0].length - 1];
};
