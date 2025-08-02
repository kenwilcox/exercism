function sum_of_multiples(limit, factors)
    sum(unique(Iterators.flatten([[i * f for i in 1:((limit-1)÷f)] for f in factors if f != 0])); init=0)
end
