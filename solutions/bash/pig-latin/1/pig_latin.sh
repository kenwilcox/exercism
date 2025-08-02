#!/usr/bin/env bash

rule1='^(xr|yt|[aeiou])'
rule2='^([^aeiou][^aeiouy]*)(.*)'
rule3='^([^aeiou]*)(qu)(.*)'

pig_say () {
    if [[ $1 =~ $rule1 ]]; then
        printf '%say' "$1"
    elif [[ $1 =~ $rule3 ]]; then
        m=( "${BASH_REMATCH[@]}" )
        printf '%s%s%say' "${m[3]}" "${m[1]}" "${m[2]}"     
    elif [[ $1 =~ $rule2 ]]; then
        printf '%s%say' "${BASH_REMATCH[2]}" "${BASH_REMATCH[1]}"
    fi
}

words=()
while (( $# )); do
    words+=( $(pig_say "$1" ) )
    shift
done

echo "${words[@]}"
