// --- Directions
// Check to see if two provided strings are anagrams of eachother.
// One string is an anagram of another if it uses the same characters
// in the same quantity. Only consider characters, not spaces
// or punctuation.  Consider capital letters to be the same as lower case
// --- Examples
//   anagrams('rail safety', 'fairy tales') --> True
//   anagrams('RAIL! SAFETY!', 'fairy tales') --> True
//   anagrams('Hi there', 'Bye there') --> False

// SOLUTION 2

function cleanString(str) {
  return str.replace(/[^\w]/g, "").toLowerCase().split("").sort().join("");
}

function anagrams(stringA, stringB) {
  return cleanString(stringA) === cleanString(stringB);
}

// SOLUTION 1

// function buildCharMap(str) {
//   const charMap = {};
//   const lowerStr = str.replace(/[^\w]/g, "").toLowerCase();

//   for (let char of lowerStr) {
//     charMap[char] = charMap[char] + 1 || 1;
//   }

//   return charMap;
// }

// function anagrams(stringA, stringB) {
//   stringAcharMap = buildCharMap(stringA);
//   stringBcharMap = buildCharMap(stringB);

//   if (Object.keys(stringAcharMap).length !== Object.keys(stringBcharMap).length) {
//     return false;
//   }

//   for (c in stringAcharMap) {
//     if (stringAcharMap[c] !== stringBcharMap[c]) {
//       return false;
//     }
//   }

//   return true;
// }

module.exports = anagrams;
