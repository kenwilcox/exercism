export const parallelLetterFrequency = async (texts) => {
  let freq = {};
  Promise.all((texts).map((text) => letterFreq(freq, text)));
  return freq;
};

const letterFreq = (freq, text) => {
  return new Promise(fn => {
    for(const [letter] of text.toLowerCase().match(/\p{Letter}/gu) || []) {
      freq[letter] = (freq[letter] || 0) + 1;
    }
    fn(freq);
  })
};
