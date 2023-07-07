// Write a function to check if a given number is even or odd. 
function checkEvenOdd() {
    var number = Number(prompt("Enter a number:"));
  
  
    if (number % 2 === 0) {
      return "The number is even.";
    } else {
      return "The number is odd.";
    }
  }
  
  // Example usage
  console.log(checkEvenOdd());