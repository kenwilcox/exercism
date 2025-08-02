function wordcount(sentence)
    sentence = lowercase(sentence)
    ret = Dict()
    for x in eachmatch(r"(\w+)(?(1)'\w+)?", sentence)
        i = x.match
        haskey(ret, i) ? ret[i] += 1 : ret[i] = 1
    end
    return ret
end
