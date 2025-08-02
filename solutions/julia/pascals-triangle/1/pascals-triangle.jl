function triangle(n)
    n < 0 && throw(DomainError(n, "must be a positive number"))
    return [[binomial(r, c) for c in 0:r] for r in 0: (n -1)]
end
