const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

function addNumbers(sum,numsLeft,completionCallback){
    if (numsLeft > 0){
        reader.question("Give me a number\n", function(num_input){
            const num = parseInt(num_input);
            sum += num;
            numsLeft -= 1;
            console.log(sum);
            addNumbers(sum, numsLeft, completionCallback);
        })
    } else {
        completionCallback(sum);
        reader.close()
    }
}
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
