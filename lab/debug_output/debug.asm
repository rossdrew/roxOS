CHAR_TABLE:
    db "0123456789ABCDEF", 0

hex_to_char:
    ;push ax ;save the registers state - is this even needed while using CALL?
    ;push bx

    lea   bx, [CHAR_TABLE]
    mov   ax, dx

    mov   ah, al            ;two copies of the byte
    shr   ah, 4             ;remove all but the high bytes in the AH copy
    and   al, 0x0F          ;remove all but the low bytes in the AL copy
    xlat                    ;1. convert AL to the character at index AL in the TABLE in BX
    xchg  ah, al            ;Put char in AH, move on to AL
    xlat                    ;2. convert AL to the character at index AL in the TABLE in BX

    lea   bx, [STRING]      ;with the output string...
    xchg  ah, al            ;put AH and AL back in the correct order
    mov   [bx], ax          ;append the new character to the string of bytes

    ;pop bx   ;needed while using CALL?
    ;pop ax
    ret

    section .bss

STRING:
    resb  50                ; reserve 50 bytes for the string