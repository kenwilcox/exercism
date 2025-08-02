//
// This is only a SKELETON file for the 'Parallel Letter Frequency' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const parallelLetterFrequency = (texts) => {
  let freq = {};
  Promise.all(texts.map(text => letterFreq(freq, text)));
  return freq;
};

const letterFreq = (freq, text) => {
  return new Promise(fn => {
    for(const [letter] of text.toLowerCase().match(/\p{Letter}/gu) || []) {
      freq[letter] = (freq[letter] || 0) + 1;
    }
    fn(freq);
  });
};
