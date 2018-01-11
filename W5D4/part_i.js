function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`);
}

// madLib('make', 'best', 'guac');


function isSubstring(searchString, subString) {
  console.log(searchString.split(' ').includes(subString))
}

// isSubstring("time to program", "time")
//
// isSubstring("Jump for joy", "joys")

function fizzBuzz(arr) {
  let result = [];
  arr.forEach(function(element) {
    if ((element % 3 == 0 || element % 5 == 0) && element % 15 != 0) {
      result.push(element)
    }
  });
  return result
}

// f = fizzBuzz([1,3,6,5,15,10,9])
// console.log(f)

function isPrime(number) {
  if (number == 1) {
    return false
  } else {
    for(var i = 2; i < number; i ++) {
      if (number % i == 0) {
        return false;
        break;
      }
    }
    return true;
  }
}
// console.log(isPrime(1))
// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

function sumOfNPrimes(num) {
  let prime_arr = [];
  if (num < 1) {
    return num
  } else {
    for (var i = 1; prime_arr.length < num; i++) {
      if (isPrime(i)) {
        prime_arr.push(i);
      }
    }
    console.log(prime_arr);
    return prime_arr.reduce((acc, val) => acc + val, 0);
  }
}

// console.log(sumOfNPrimes(0));
// 0
// console.log(sumOfNPrimes(1));
// 2
// console.log(sumOfNPrimes(2));
// console.log(sumOfNPrimes(4));
// 17
