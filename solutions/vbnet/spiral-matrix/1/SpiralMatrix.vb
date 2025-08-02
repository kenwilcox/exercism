Imports System

Public Class SpiralMatrix
    Public Shared Function GetMatrix(ByVal size As Integer) As Integer(,)
        Dim result(size-1, size-1) As Integer
        Dim row = -1, col = 0, r = 1, c = 0
        For i = 1 To size * size
          If row+r < 0 OrElse row+r >= size OrElse col+c >= size OrElse result(col+c, row+r) > 0 Then
            Dim t = -c
            c = r
            r = t
          End If

          row = row+r
          col = col+c
          result(col, row) = i
      Next
      Return result
    End Function
End Class
