[BITS 16]				;Assembler : 16 bit code
[ORG 0x7C00]			;Assembler : Location of code in memory

MOV SI, GreetingString 	;Store string pointer to SI
CALL PrintString		;Call print string procedure
JMP $ 					;Infinite loop, hang it here.


%include "print_string.asm"

;Data
GreetingString db 'Loading RoxOS...', 0		;Null terminated string

; --------------------------------------
; Create the bootsector structure of 512 
; bits and signature.
; - PLACEHOLDER LABEL ONLY -
; --------------------------------------
CreateBootSector:
 TIMES 510 - ($ - $$) db 0			;Fill with 0s
 DW 0xAA55							;Add signature