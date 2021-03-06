[BITS 16]               ;Assembler : 16 bit code
[ORG 0x7C00]            ;Assembler : Location of code in memory

CALL PrintWelcome
CALL PrintNewline

MOV DX, 0x00        ; TEST: Print '00'
CALL PrintHexValue
CALL PrintNewline

MOV DX, 0x78        ; TEST: Print '78'
CALL PrintHexValue
CALL PrintNewline

MOV DX, 0xFF        ; TEST: Print 'FF'
CALL PrintHexValue
CALL PrintNewline

JMP $               ;Infinite loop, hang it here.

%include "../common/printing.asm"

; --------------------------------------
; Print Welcome message
; --------------------------------------
PrintWelcome:
 MOV SI, GreetingString  
 CALL PrintString        
RET

; --------------------------------------
; Print debug hex value
;  DX = Byte to print
; --------------------------------------
PrintHexValue: 
 CALL HexToChar
 MOV SI, HexString
 CALL PrintString
RET

; --------------------------------------
; Convert byte to ASCII hex string
;  DX = Byte to print
; --------------------------------------
HexToChar:
    ;push ax ;save the registers state - is this even needed while using CALL?
    ;push bx

    lea   bx, [HexTable]
    mov   ax, dx

    mov   ah, al            ;two copies of the byte
    shr   ah, 4             ;remove all but the high bytes in the AH copy
    and   al, 0x0F          ;remove all but the low bytes in the AL copy
    xlat                    ;1. convert AL to the character at index AL in the TABLE in BX
    xchg  ah, al            ;Put char in AH, move on to AL
    xlat                    ;2. convert AL to the character at index AL in the TABLE in BX

    lea   bx, [HexString]   ;with the output string...
    xchg  ah, al            ;put AH and AL back in the correct order
    mov   [bx], ax          ;append the new character to the string of bytes

    ;pop bx   ;Restore registers state - needed while using CALL?
    ;pop ax
RET

;Data
GreetingString db 'Loading RoxOS [DEBUG - Test Bytes]...', 0     ;Null terminated string
HexTable db "0123456789ABCDEF", 0
HexString db '' , 0

; --------------------------------------
; Create the bootsector structure of 512 
; bits and signature.
; - PLACEHOLDER LABEL ONLY -
; --------------------------------------
CreateBootSector:
 TIMES 510 - ($ - $$) db 0          ;Fill with 0s
 DW 0xAA55                          ;Add signature