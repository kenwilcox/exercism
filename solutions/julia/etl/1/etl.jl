function transform(input::AbstractDict)
    Dict(lowercase(letter) => value for (value, list) in input for letter in list)
end

