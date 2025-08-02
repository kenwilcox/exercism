export const isArmstrongNumber = num => 
  [...`${num}`]
  .reduce((sum, digit, _, { length }) => 
    sum += BigInt(digit) ** BigInt(length), BigInt(0)) === BigInt(num);
