export class InvalidInputError extends Error {
  constructor(message: string) {
    super()
    this.message = message || 'Invalid Input'
  }
}

type Direction = 'north' | 'east' | 'south' | 'west'
type Coordinates = [number, number]

export class Robot {
  #bearing: Direction = 'north'
  #coordinates: Coordinates = [0,0]
  
  get bearing(): Direction {
    return this.#bearing
  }

  get coordinates(): Coordinates {
    return this.#coordinates
  }

  place({x, y, direction}: { x: number; y: number; direction: Direction }) {
    if (!['north', 'south', 'east', 'west'].includes(direction)) {
      throw new InvalidInputError('direction parameter is not a Direction')
    }
    this.#bearing = direction
    this.#coordinates = [x, y]
  }

  evaluate(instructions: string) {
    for(const instruction of instructions) {
      switch(instruction) {
        case 'A': this.#advance(); break;
        case 'R': this.#turnRight(); break;
        case 'L': this.#turnLeft(); break;
      }
    }
  }

  #advance() {
    switch (this.#bearing) {
      case 'north': this.#coordinates[1] += 1; break;
      case 'east': this.#coordinates[0] += 1; break;
      case 'south': this.#coordinates[1] -= 1; break;
      case 'west': this.#coordinates[0] -= 1; break;
    }
  }

  #turnRight() {
    switch(this.#bearing) {
      case 'north': this.#bearing = 'east'; break;
      case 'east': this.#bearing = 'south'; break;
      case 'south': this.#bearing = 'west'; break;
      case 'west': this.#bearing = 'north'; break;        
    }
  }

  #turnLeft() {
    switch(this.#bearing) {
      case 'north': this.#bearing = 'west'; break;
      case 'east': this.#bearing = 'north'; break;
      case 'south': this.#bearing = 'east'; break;
      case 'west': this.#bearing = 'south'; break;        
    }    
  }
}
