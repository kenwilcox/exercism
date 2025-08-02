export class List {
  constructor(values) {
    this.values = values || []
  }

  append(list) {
    return new List([...this.values, ...list.values])
  }

  concat(list) {
    return list.foldl((h, t) => h.append(t), this);
  }

  filter(fn) {
    return new List(this.foldl((h, t) => fn(t) ? [...h, t] : h, []))
  }

  map(fn) {
    return new List(this.foldl((h, t) => [...h, fn(t)], []))
  }

  length() {
    return this.foldl(i => i + 1, 0)
  }

  foldl(fn, initial, list) {
    const[head, ...tail] = list || this.values;
    return head ? this.foldl(fn, fn(initial, head), tail) : initial
  }

  foldr(fn, initial) {
    return this.reverse().foldl(fn, initial)
  }

  reverse() {
    return new List(this.foldl((h, t) => [t, ...h], []))
  }
}
