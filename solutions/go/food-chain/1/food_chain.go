package foodchain

import (
    "fmt"
    "strings"
)

var creatures = []string{"fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse",
                        "spider that wriggled and jiggled and tickled inside her"}

var comments = []string{"I know an old lady who swallowed a %s.",
                     "She swallowed the %s to catch the %s.","",
                     "I don't know why she swallowed the fly. Perhaps she'll die.",
                     "It wriggled and jiggled and tickled inside her.",
                     "How absurd to swallow a bird!",
                     "Imagine that, to swallow a cat!",
                     "What a hog, to swallow a dog!",
                     "Just opened her throat and swallowed a goat!",
                     "I don't know how she swallowed a cow!",
                     "She's dead, of course!"}

func Verse(v int) string {
	res := []string{fmt.Sprintf(comments[0], creatures[v-1]), comments[v+2]}
    if v > 1 && v < 8 {
        for a := v -1; a >= 1; a -= 1 {
            k := a-1; if a == 2 {k = 8}
            verse := fmt.Sprintf(comments[1], creatures[a], creatures[k])
            res = append(res, verse)
        }
        res = append(res, comments[3])
    }
    return strings.Join(res, "\n")
}

func Verses(start, end int) string {
	res := []string{}
    for v := start; v <= end; v += 1 {
        res = append(res, Verse(v))
    }
    return strings.Join(res, "\n\n")
}

func Song() string {
	return Verses(1, 8)
}
