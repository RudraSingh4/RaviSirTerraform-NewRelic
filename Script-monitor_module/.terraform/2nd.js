// Write a function to find the maximum of two numbers. 

function Maximumnumber() {
    var num1 = Number(prompt("Enter the first number:"));
    var num2 = Number(prompt("enter the second number:"));
    
      if (num1 > num2) {
        return "The maximum number is: " + num1;
        
      } else if (num2 > num1) {
        return "The maximum number is: " + num2;
        
      } else {
        return "Both numbers are equal.";
      }
    }

    console.log(Maximumnumber());