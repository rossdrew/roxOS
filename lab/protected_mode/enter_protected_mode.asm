[ bits 16]

; ------------------------
; Switch to protected mode
; ------------------------
switch_to_pm :
 cli ; We must switch of interrupts until we have set -up the protected mode interrupt

 lgdt [ gdt_descriptor ]    ; Load GDT
 mov eax, cr0               ; Swtich to protected mode = set first byte of CR0 (Control Register)
 or eax, 0x1 
 mov cr0, eax
 jmp CODE_SEG:init_pm       ; Far jump to 32 bit code.  This forces CPU to flush its pieline.
 
[ bits 32]

; ---------------------------------
; Initialise PM registers and stack
; ---------------------------------
init_pm :
 mov ax, DATA_SEG           ; New Protected Mode data segments defined in GDT
 mov ds, ax
 mov ss, ax
 mov es, ax
 mov fs, ax
 mov gs, ax
 mov ebp, 0x90000           ; Move stack to top of free space
 mov esp, ebp
 call BEGIN_PM