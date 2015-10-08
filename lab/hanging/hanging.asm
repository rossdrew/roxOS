;
; Endlessly Looping Boot Sector
;

loop:						;Label

  jmp loop 					;Jump to loop label

  times 510-($-$$) db 0 	;Pad the program to be 512b

  dw 0xaa55 				;Label as boot sector