#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#n::
Run, C:\Users\kalsf\AppData\Local\Programs\Notion\Notion.exe
return


#T::
FormatTime, xx,, yyyMMdd HHss
SendInput, %xx%
return


:://tsd:: 
FormatTime, xx,, yyy/MM/dd HH:ss
ClipSaved := ClipboardAll ; save the entire clipboard to the variable ClipSaved
clipboard := ""           ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
clipboard =               ; copy this text:
(
_____________________________________________________________________________________________

Translated By: Ramesh Dura, Translation Date: %xx%, 
Company Name: GMT International Co. Ltd., Tel: 03-5937-5314, Cell: 080-4150-5314,
Address: 〒169-0073 Tokyo Prefecture, Shinjuku City, Hyakunincho, 2-14-4
)
ClipWait, 2              ; wait max. 2 seconds for the clipboard to contain data. 
if (!ErrorLevel)         ; If NOT ErrorLevel, ClipWait found data on the clipboard
    Send, ^v             ; paste the text
Sleep, 300
; clipboard := ClipSaved   ; restore original clipboard
; ClipSaved =              ; Free the memory in case the clipboard was very large.
return


:://gmtinfo::
;ClipSaved := ClipboardAll ; save the entire clipboard to the variable ClipSaved
clipboard := ""           ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
clipboard =               ; copy this text:
(
http://www.gmt-intl.com

*GMT International Co. Ltd. 🇳🇵 🇯🇵*
📍Address: 2 Chome-14-4 Hyakunincho, Shinjuku City, Tokyo 169-0073
🗾Map : https://goo.gl/maps/edyhE8VpKjNMGgRs5
📞Viber/Phone: +81-80-4150-5314
☎Tel:+81-3-5937-5314 
✉Email: samudraparinews@gmail.com
🌎Web: www.samudrapari.com

JP Bank Account Number:
10120-51602201

🌸🙏🙏🙏🌸
)
ClipWait, 2              ; wait max. 2 seconds for the clipboard to contain data. 
if (!ErrorLevel)         ; If NOT ErrorLevel, ClipWait found data on the clipboard
    Send, ^v             ; paste the text
Sleep, 300
;clipboard := ClipSaved   ; restore original clipboard
;ClipSaved =              ; Free the memory in case the clipboard was very large.
return

:://em1:: kals.future@gmail.com
:://em2:: me.rameshdura@gmail.com

:://pw1:: BigBrack3t[]
:://pw2:: CurlyBrack3t/{/}
:://pw3:: Silver22
:://pw4:: Silver2

:://sd:: -Ramesh Dura®

:://no1:: 
Send, {BackSpace BackSpace BackSpace BackSpace BackSpace}
Run, notion://www.notion.so/Task-Board-d26a822535b443648a6efed6f1b9019e
return

:://no2:: 
Send, {BackSpace BackSpace BackSpace BackSpace BackSpace}
Run, notion://www.notion.so/Work-To-Never-Regret-cfc0a9c88c484e16bda5f73269ef6eb0
return


;-- DOSCOMMANDHERE XP ctrl+alt+d :
 ^!d::cmdHere()

cmdHere() {
	If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass")
		WinGetText, data
	Run, cmd, % RegExMatch(data, "i`am)^Address: \K.*", dir) ? dir : A_Desktop
	; You'll need to change the word "Address" to your os language.
}