; Load the Json.ahk library
#Include %A_LineFile%\..\library\JSON.ahk
csvFile := "message.csv"
myMessages := {}
FileRead, csvContents, %csvFile%
allcontent := csvContents
rows := StrSplit(allcontent, "`r`n")
for i, row in rows
{
    ; Split the row into title and content
    columns := StrSplit(row, ",")
    title := columns[1]
    content := columns[2]
	content := removeQuote(content)
    myMessages [title] := content
}
for message in myMessages
{
    keys.push(message)
	choices .= message "|"
}

;FUNCTION ACTION----------------
quickType(param) {
	if (param != "") {
			ClipSaved := ClipboardAll 
			clipboard := ""           
			clipboard = %param%
			ClipWait, 2            
			if (!ErrorLevel)                    
			Send, !{Esc}
			Send, ^v 
			Sleep, 300
			clipboard := ClipSaved   
			ClipSaved =  
		}
}



removeQuote(text) {
    ; remove outermost quotes
    text := RegExReplace(text, "^""|""$", "")
    ; remove one level of quotes within text
    text := RegExReplace(text, """(""[^""]+"")""", "$1")
    return text
}







^!j::
;views----------------
if WinExist("Quick Reply by Ramesh Dura") {
	WinActivate, Quick Reply by Ramesh Dura
} else {
	; Menu, Tray, Icon, quickreplyicon.ico ; use a valid icon file name
	Gui, Add, ListBox, x22 y9 w150 h320 vMyListBox gQuickPreview, %choices%
	Gui, Add, Edit, x182 y9 w280 h310 vMessagePreview, Edit
	Gui, Add, Button, x22 y329 w150 h30 Default gSubmit, Submit
	; Generated using SmartGUI Creator 4.0
	Gui, Show, x759 y229 h379 w485, Quick Reply by Ramesh Dura
	
	
text := "test text ""first"" and ""sometext"" and ""sometext"" and something random text" ; input text

text := RegExReplace(text, """([^""]+)""", """$1""") ; replace ""sometext"" with "sometext"

;MsgBox % text

}


;CONTROL ACTION----------------
Submit: 
    GuiControlGet, SelectedItem,, MyListBox
	if (SelectedItem != "") {
		if (myMessages.HasKey(SelectedItem)) {
			value := myMessages[SelectedItem]
			quickType(value)
			GuiControl,, MessagePreview, %value%
			

			
			Gui, Destroy
		}
	}
return


;FUNCTION ACTION----------------
QuickPreview:
 GuiControlGet, SelectedItem,, MyListBox
 if (SelectedItem != "") {
		if (myMessages.HasKey(SelectedItem)) {
			value := myMessages[SelectedItem]
			GuiControl,, MessagePreview, %value%
		}
	}else{
		;MsgBox "Empty"
	}
return	


GuiClose:
GuiEscape:
	Gui, Destroy
	return

;notes
; Gui, Destroy    //this destroys the gui but the script remains active