' Small macro in Visual Basic, in order to check if any case has any customizable special character and a specific lenght based in a current selection.
' It will paint in coulor the cell detected, and add borders in coulor too if the lenght is surpassed.


Sub HighlightSpecialCharacters()

    Dim r As Range
    Dim cell As Range
    Dim Char As String
    Dim i As Integer
    Dim HasSpecialCharacter As Boolean

    ' Set the range based on the current selection, it is thinked to be done by columns.
    Set r = Selection

    ' Clear the cells if they have any previous format, so we can run it over again to re-check.
    For Each cell In r
        If cell.Value <> "" Then
            cell.Borders.LineStyle = xlNone ' Clear the color borders
            cell.Interior.ColorIndex = xlNone ' Clear the fill color
            cell.Font.ColorIndex = xlAutomatic ' Set the font color to default
            cell.Font.Bold = False ' Clear the bold format
        End If
    Next cell

    ' Check each cell in the selected range
    For Each cell In r
        HasSpecialCharacter = False
        ' If the cell has more than 35 characters, add a red border. Change here if you want any other length.
        If Len(cell.Value) > 35 Then
            With cell.Borders(xlEdgeBottom)
                .LineStyle = xlContinuous
                .Color = RGB(255, 0, 0) ' Red, change here for any other border color.
                .Weight = xlThin
            End With
            With cell.Borders(xlEdgeTop)
                .LineStyle = xlContinuous
                .Color = RGB(255, 0, 0) ' Red, change here for any other border color.
                .Weight = xlThin
            End With
            With cell.Borders(xlEdgeLeft)
                .LineStyle = xlContinuous
                .Color = RGB(255, 0, 0) ' Red, change here for any other border color.
                .Weight = xlThin
            End With
            With cell.Borders(xlEdgeRight)
                .LineStyle = xlContinuous
                .Color = RGB(255, 0, 0) ' Red, change here for any other border color.
                .Weight = xlThin
            End With
        End If
        ' Check each character in the cell
        For i = 1 To Len(cell.Value)
            Char = Mid(cell.Value, i, 1)
            ' If the character is not a letter, number, dot, space or other
            If Not (Char Like "[A-Za-z0-9 /.ﬂ,&ñÑ-]") Then ' Change the value between brackets in order to set which characters you dont want to detect
                HasSpecialCharacter = True
                ' Highlight the problematic character in red and bold
                cell.Characters(i, 1).Font.Color = RGB(255, 0, 0) ' Red color, change here for any other color.
                cell.Characters(i, 1).Font.Bold = True
                ' Print the problematic character and its position
                Debug.Print "Problematic character: '" & Char & "' at position " & i & " in cell " & cell.Address
            End If
        Next i
        
        If HasSpecialCharacter Then
            ' Highlight the cell in light yellow if it contains a special character
            cell.Interior.Color = RGB(248, 250, 202) ' You can set up any other color here. 
        End If
    Next cell

End Sub
