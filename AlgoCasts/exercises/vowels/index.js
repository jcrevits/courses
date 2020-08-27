// --- Directions
// Write a function that returns the number of vowels
// used in a string.  Vowels are the characters 'a', 'e'
// 'i', 'o', and 'u'.
// --- Examples
//   vowels('Hi There!') --> 3
//   vowels('Why do you ask?') --> 4
//   vowels('Why?') --> 0

const vowelArray = ["a", "e", "i", "o", "u"]

function vowels(str) {
  const matches = str.match(/[aieou]/gi);
  return matches ? matches.length : 0;
}

// function vowels(str) {
//   let counter = 0;

//   for (let c of str.toLowerCase()) {
//     if (vowelArray.includes(c)) {
//       counter++;
//     }
//   }

//   return counter;
// }

module.exports = vowels;
