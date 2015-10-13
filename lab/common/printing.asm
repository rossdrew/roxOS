; --------------------------
; Print character to screen
;  AL = ASCII value to print
; --------------------------
PrintCharacter:
 MOV AH, 0x0E			;BIOS : Print char
 MOV BH, 0x00			;Page no.
 MOV BL, 0x07			;Text attribute 0x07 is lightgrey font on black background

 INT 0x10				;Video interrupt
RET

; --------------------------------
; Print string to screen
;  SI = pointer to string to print
; --------------------------------
PrintString:
 next_character:
  MOV AL, [SI]			;Move byte from SI to AL (current char)
  INC SI				;Increment SI (char) pointer
  OR AL, AL				;Check for end (0) of string
  JZ exit_function
  CALL PrintCharacter 	;Print next char (AL)
  JMP next_character	;NEXT
 exit_function:
RET

; --------------------------------
; Prints newline characters
; --------------------------------
PrintNewline:
 MOV SI, NEWLINE
 CALL PrintString
RET
 

NEWLINE db 0ah,0dh,0
