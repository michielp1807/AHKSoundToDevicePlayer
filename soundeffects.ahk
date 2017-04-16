#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force
DetectHiddenWindows, On

; INFO: (please read)
;
; AudioDevice is the number associated with the audio device you want to use
; To get the right audio device try some numbers, starting from 0 until you get the right one
AudioDevice = 5

; For more info about hotkeys: https://autohotkey.com/docs/Hotkeys.htm
;
; Cheat sheet:
; 
; # -> Windows Key
; ! -> Alt Key
; ^ -> Control Key
; + -> Shift Key
;
; ~ -> Still send hotkey through to other programs, without this character other programs will not respond to the hotkey when you're using it in this script
;
; Exmples:
; 
; ^A:: -> Control + A (note that when using this you won't be able to use control + a in other programs, if you do want to use control + a in other programs use ~^A::)
; +^Numpad0:: -> Control + Shift + Zero key on numpad
; +^Numpad0:: -> Control + Shift + Zero key on numpad
; ^+Home:: -> Control + Shift + Home key
;
; For more key names see: https://autohotkey.com/docs/KeyList.htm
;
; Use these commands to assign audio files to hotkeys:

~^A:: PlaySound("/soundeffects/airhorn.wav", AudioDevice)
~^B:: PlaySound("/soundeffects/beethoven.wav", AudioDevice)
+^C:: PlaySound("/soundeffects/tada.mp3", AudioDevice)
+^D:: KillSound() 

; Add as many as you like

PlaySound(Sound, AudioDevice) {
	run, %comspec% /k "playsound %Sound% %AudioDevice%" , , hide
	WinWait, ahk_class ConsoleWindowClass
	Process, Close, cmd.exe
}

KillSound() {
	Process, Exist, playsound.exe
	if Errorlevel {
		Process, Close, playsound.exe
		KillSound()
	}
}