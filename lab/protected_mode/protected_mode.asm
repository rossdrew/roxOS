[ org 0 x7c00 ]
 mov bp, 0x9000 ; Set the stack.
 mov sp, bp
 mov bx, MSG_REAL_MODE
; call PrintWelcome
 call switch_to_pm ; Note that we never return from here.
 jmp $

 ;%include "../common/printing.asm"
 %include "gdt_description.asm"
 ;%include "print_string_pm.asm"
 %include "enter_protected_mode.asm"

[ bits 32]

; Define some constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

; prints a null - terminated string pointed to by EDX
print_string_pm :
 pusha
 mov edx, VIDEO_MEMORY ; Set edx to the start of vid mem.

print_string_pm_loop :
 mov al, [ ebx ]          ; Store the char at EBX in AL
 mov ah, WHITE_ON_BLACK   ; Store the attributes in AH
 cmp al, 0                ; if (al == 0), at end of string , so
 je print_string_pm_done  ; jump to done
 mov [edx], ax            ; Store char and attributes at current character cell.
 add ebx, 1               ; Increment EBX to the next char in string.
 add edx, 2               ; Move to next character cell in vid mem.
 jmp print_string_pm_loop ; loop around to print the next char.

print_string_pm_done :
 popa
ret ; Return from the function

; This is where we arrive after switching to and initialising protected mode.
BEGIN_PM :
 mov ebx, MSG_PROT_MODE
 call print_string_pm     ; Use our 32- bit print routine.
 jmp $                    ; Hang.


; Global variables
MSG_REAL_MODE db " Started in 16- bit Real Mode ", 0
MSG_PROT_MODE db " Successfully landed in 32- bit Protected Mode ", 0

; Bootsector padding
times 510 -($-$$) db 0
dw 0xaa55