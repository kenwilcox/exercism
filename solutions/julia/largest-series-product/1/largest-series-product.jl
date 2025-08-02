function largest_product(str, span)
    0 <= span <= length(str) || throw(ArgumentError("span out of range"))    
    (iszero(span) || isempty(str)) && return 1
    
    digits = zeros(Int8, span)
    largest = 0
    
    for c in str
        isdigit(c) || throw(ArgumentError("str must only contain digits"))
        popfirst!(digits)
        push!(digits, c - '0')
        largest = max(largest, prod(digits))
    end
    
    largest
end
