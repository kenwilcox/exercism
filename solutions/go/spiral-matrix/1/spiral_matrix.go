package spiralmatrix

func SpiralMatrix(size int) [][]int {
	result := [][]int{}
    for row := 0; row < size; row++ {
        result = append(result, make([]int, size))
    }

    row, col := 0, 0
    r, c := 0, 1
    for i := 1; i <= size*size; i++ {
        result[row][col] = i
        if row+r < 0 || size <= row+r || col+c < 0 ||
           size <= col+c || result[row+r][col+c] != 0 {
               r, c = c, -r
           }
        row, col = row+r, col+c
    }
    return result
}
