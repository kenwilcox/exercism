function saddlepoints(M)
    rowmax = maximum(M, dims=2, init=-Inf)
    colmin = minimum(M, dims=1, init=Inf)
    Tuple.(findall(rowmax .== colmin))
end
