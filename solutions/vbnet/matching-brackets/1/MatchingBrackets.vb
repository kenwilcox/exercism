Imports System.Collections.Generic

Public Module MatchingBrackets
    Public Function IsPaired(ByVal input As String) As Boolean
        Dim pairs As New Dictionary(of String, String) From {
          {"(", ")"},
          {"[", "]"},
          {"{", "}"}
        }

        Dim stack as Stack(Of String) = New Stack(Of String)()
        For Each c as Char in input
          Dim s = c.ToString()
          If "{[(".Contains(s) Then
            stack.Push(s)
          ElseIf "}])".Contains(s) Then
            If stack.Count = 0 Then Return False
            Dim p = pairs(stack.Pop())
            If s <> p Then Return False
          End If
        Next
        Return stack.Count = 0
    End Function
End Module
