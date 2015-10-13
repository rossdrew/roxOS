
; TODO Figure out the best way to pass HexString to this imported library

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