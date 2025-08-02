export class ZebraPuzzle {
  #houses = []
  
  constructor() {
    const pNations = permute(nations);
    const pColors = permute(colors);
    const pDrinks = permute(drinks);
    const pSmokes = permute(smokes);
    const pPets = permute(pets);

    this.#houses = pNations.reduce((houses, list) => {
      if (list[0] == 'Norwegian') {houses.push(list.map(nation => ({ nation })));}
      return houses;
    }, []).reduce((houses, street) => {
      pColors.forEach((colors) => {
        if (colors[1] === 'blue' &&
            colors.indexOf('green') - colors.indexOf('ivory') === 1 &&
            colors[street.findIndex(h => h.nation === 'Englishman')] === 'red'
        ){
          houses.push(street.map((house, i) => ({ ...house, color: colors[i] })));
        }
      });
      return houses;
    }, []).reduce((houses, street) => {
      pDrinks.forEach((drinks) => {
        if (
          drinks[2] === 'Milk' &&
          drinks[street.findIndex(h => h.nation === 'Ukrainian')] === 'Tea' &&
          drinks[street.findIndex(h => h.color === 'green')] === 'Coffee'
        ) {
          houses.push(street.map((house, i) => ({ ...house, drink: drinks[i] })));
        }
        });
      return houses;
    }, []).reduce((houses, street) => {
      pSmokes.forEach((smokes) => {
        if (
          smokes[street.findIndex(h => h.color === 'yellow')] === 'Kools' &&
          smokes[street.findIndex(h => h.drink === 'Orange juice')] === 'Lucky Strike' &&
          smokes[street.findIndex(h => h.nation === 'Japanese')] === 'Parliaments'
        ) {
          houses.push(street.map((house, i) => ({ ...house, smoke: smokes[i] })));
        }
      });
      return houses;
    }, []).reduce((houses, street) => {
      pPets.forEach((pets) => {
        if (
          pets[street.findIndex(h => h.nation === 'Spaniard')] === 'Dog' &&
          pets[street.findIndex(h => h.smoke === 'Old Gold')] === 'Snails' &&
          pets[street.findIndex(h => h.smoke === 'Kools')] === 'Horse' &&
          (pets[street.findIndex(h => h.smoke === 'Chesterfields') + 1] === 'Fox' ||
           pets[street.findIndex(h => h.smoke === 'Chesterfields') - 1] === 'Fox')
        ) {
          houses.push(street.map((house, i) => ({ ...house, pet: pets[i] })));
        }
      });
      return houses;
    }, []).at(-1);
  }

  waterDrinker() {
    return this.#houses.find(house => house.drink == 'Water').nation;
  }

  zebraOwner() {
    return this.#houses.find(house => house.pet === 'Zebra').nation;
  }
}

const nations = ['Englishman', 'Spaniard', 'Ukrainian', 'Norwegian', 'Japanese'];
const colors = ['red', 'green', 'ivory', 'yellow', 'blue'];
const drinks = ['Coffee', 'Tea', 'Milk', 'Orange juice', 'Water'];
const smokes = ['Old Gold', 'Kools', 'Chesterfields', 'Lucky Strike', 'Parliaments'];
const pets = ['Dog', 'Snails', 'Fox', 'Horse', 'Zebra'];

function permute(items) {
  return items.length == 1 ? [items] : items.reduce((permutations, item, idx) => {
    permute(items.slice(0, idx).concat(items.slice(idx + 1)))
      .forEach((part) => permutations.push([item, ...part]));
    return permutations;
  }, []);
}
