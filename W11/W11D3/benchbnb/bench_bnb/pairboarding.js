const longestPalindrome = (str) => {
    let maxLength = 0;
    let maxIndex;
    let newStr = str.split("").join("#");
    let currLength;

    for (let i = 0, n = newStr.length; i < n; i++) {
        debugger
        let j = 1;
        while (newStr[i + j] === newStr[i - j]) {
            j++;
        }

        currLength = 2 * (j - 1) + 1; 
        if (currLength > maxLength) {
            maxLength = currLength;  
            maxIndex = i - (j - 1);   
        }
    }
    
    lettmp = newStr.slice(maxIndex, maxIndex + maxLength);
    let result = "";

    for (let i = 0, n = tmp.length; i < n; i++) {
        if (tmp[i] !== "#") {
            result += tmp[i];
        }
    }
    return result;
};


console.log(longestPalindrome("babad"));
console.log(longestPalindrome("cbbd"));
